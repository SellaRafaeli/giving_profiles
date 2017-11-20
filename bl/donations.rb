$donations = $mongo.collection('donations')

DONATION_FIELDS = [:user_id, :org_name, :org_id, :amount]

def user_donations(user_id)
  return $donations.all
  $donations.get_many(user_id: user_id) 
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