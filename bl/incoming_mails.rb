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

post '/incoming_mail_webhook' do
  {msg: "ok"}
end

post '/incoming_mail' do
  text     = pr[:text].downcase
  all_orgs = $orgs.get_many({},projection: {name:1});
  name = all_orgs.select {|d| text.include?(d['name'].downcase) }.sort_by {|s| -s['name'].size }[0]['name'] rescue 'n/a'
  amount = get_amount_nearest_org_name(text,name)  
  {name: name, amount: amount}
end

get '/mails_tester' do
  erb :mails_tester2, default_layout
end

# template :mails_tester do  
#   "<%= 1+1 %>"
# end

