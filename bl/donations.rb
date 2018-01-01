$donations = $mongo.collection('donations')

DONATION_FIELDS = [:user_id, :org_name, :org_id, :amount]

def user_donations(user_id)
  #return $donations.all
  $donations.get_many(user_id: user_id).reverse 
end

def user_causes_hash(user)
  donations = user_donations(user['_id'])
  res = {}
  donations.each {|d|
    type = $orgs.get(d['org_id'])['type'] rescue nil
    if type
      res[type] ||= 0
      res[type]  += d['amount'].to_f
    end
  }
  res = res.sort_by{|_key, value| value}.reverse.to_h
  # org_ids   = donations.mapo('org_id').uniq
  # orgs      = $orgs.get_many(_id: {'$in': org_ids})
  # causes    = orgs.mapo('type').compact
  # causes_h  = causes.hash_of_num_occurrences #by num of organizations
rescue => e
  {}
end

post '/donations' do
  amount = pr[:amount].to_i
  data   = pr.just(DONATION_FIELDS)
  name   = pr[:org_name]
  #org    = $orgs.get(name: Regexp.new(name, Regexp::IGNORECASE))
  org    = $orgs.get(name: name)
  halt_back("No such organization: #{name}") if !org
  halt_back("Amount must be positive") if !(amount > 0)
  
  data[:org_id] = org[:_id]
  data[:user_id] = cuid
  
  $donations.add(data)
  
  flash.message = 'Thanks!'
  redirect back
end

post '/donations/:id/edit' do
  params['private'] = false if pr[:private]=="false"
  params['private'] = true if pr[:private]=="true"
  $donations.update_id(pr[:id],pr)
  {msg: 'ok'}
end

get '/donations/delete' do
  don = $donations.get(pr[:id])
  halt unless don[:user_id] == cuid
  $donations.delete_one(_id: pr[:id])
  flash_and_back('Donation deleted.')
end

get '/my_donations_privacy_settings'  do
  erb :'user_settings/my_donations_privacy_settings', default_layout
end