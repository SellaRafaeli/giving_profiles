$donations = $mongo.collection('donations')

DONATION_FIELDS = [:user_id, :org, :amount]

def user_donations(user_id)
  return $donations.all
  $donations.get_many(user_id: user_id) 
end

post '/donations' do
  data = pr.just(DONATION_FIELDS)
  data[:user_id] = cuid
  $donations.add(data)
  flash.message = 'Thanks!'
  redirect back
end