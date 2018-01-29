$received_emails = $mongo.collection('received_emails')
$get_text_data_results = $mongo.collection('get_text_data_results')

def get_amount_nearest_org_name(text,org_name)
  text      = text.delete(',').downcase
  numbers   = text.scan(/\d+/)
  distances = numbers.map {|n| 
    dist = text.index(n) - text.index(org_name.downcase)
    {dist: dist, n: n}
  }
  amount = distances.sort_by {|d| d[:dist] }.first[:n]
  amount
rescue 
  -1 
end

def get_org_name_in_text_old(text)  
  all_orgs = $orgs.get_many({},projection: {name:1});
  name = all_orgs.select {|d| text.to_s.downcase.include?(d['name'].downcase) }.sort_by {|s| -s['name'].size }[0]['name'] rescue 'n/a'
end

def get_org_name_in_text(text)  
  text = text.to_s.downcase
  res = []
  $orgs.paginated_do({}) { |org|
    #puts org['name'] if org['name'] == 'DRAGOS FOUNDATION'
    res.push(org) if text.include?(org['name'].downcase)
  }
  #puts "res "
  #puts res
  res.sort_by {|s| -s['name'].size }[0]['name'] rescue 'n/a'
end

def get_text_data(text)
  name   = get_org_name_in_text(text)
  amount = get_amount_nearest_org_name(text,name) 
  $get_text_data_results.add({text: text, name: name, amount: amount})
  return name, amount
end

post '/incoming_mail_webhook' do
  $received_emails.add(pr)
  Thread.new {
    email = pr[:From]
    text  = pr[:TextBody]
    user  = $users.get(email: email.to_s.downcase)
    name, amount = get_text_data(text)
    if user && (org = $orgs.get(name: name))
      data = {org_name: name, org_id: org['_id'], user_id: user['_id'], amount: amount}
      $donations.add(data)
    end  
  }
  
  {msg: 'ok'}
end

post '/incoming_mail' do
  text     = pr[:text].downcase  
  name, amount = get_text_data(text)
  {name: name, amount: amount}  
end

get '/mails_tester' do
  erb :mails_tester2, default_layout
end

# template :mails_tester do  
#   "<%= 1+1 %>"
# end

