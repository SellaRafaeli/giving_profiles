$donations = $mongo.collection('donations')

DONATION_FIELDS = [:user_id, :org_name, :org_id, :amount]

def user_donations(user_id)
  return $donations.all
  $donations.get_many(user_id: user_id) 
end

post '/donations' do
  data = pr.just(DONATION_FIELDS)
  if !data[:org_id] 
    org = create_org(data[:org_name])
    data[:org_id] = org[:_id]
  end

  data[:user_id] = cuid
  $donations.add(data)
  flash.message = 'Thanks!'
  redirect back
end