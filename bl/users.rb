$users = $mongo.collection('users')

ALL_NETWORKS = ['yale', 'harvard', 'stanford', 'caltech']
USER_FIELDS  = [:nick,:name,:address,:network,:philosophy,:fav_org,:fav_org_text,:fav_cause,]

def reset_all
  $users.delete_many
  ['Matt A.','John Doe','Jane Doe'].each {|name|
    $users.add(name: name, nick: name, address: 'Some address', network: ALL_NETWORKS.sample, philosophy: "Give until you feel it. A lot of the answers here are going the 'give what you are comfortable giving' route.  My philosophy is: 'Give until it starts to be uncomfortable.", fav_org: 'Sierra Nevada Land Trust', fav_cause: 'Environmentalism', fav_org_text: 'It must have been tails, because here I am in California! I actually had never been to California before I drove here from my home state of North Carolina in the middle of January to serve the Sierra. I remember my first thoughts as we passed the Welcome to California sign being “Wow! This is a really beautiful place”. Then, I started thinking about how the landscape reminded me of “Homeward Bound”, one of my favorite movies in the whole wide world. My journey here is somewhat similar to the adventures of Shadow, Sassy and Chance as I overcome obstacles, form amazing friendships and have fun!')
  }

  $orgs.delete_many
  ['Red Cross', 'Doctors Without Borders', 'Make a Wish Foundation'].each {|name|
    create_org(name)
  }

  10.times {
    org = $orgs.random
    $donations.add(user_id: $users.random[:_id], org_id: org['_id'], org_name: org['name'], amount: rand(1000).to_i)  
  }  
end

get '/users/reset' do
  set_users
  redirect '/login/random'
end

get '/login/:nick' do
  user = $users.get(nick: pr[:nick]) || $users.random
  session[:user_id] = user[:_id]
  redirect '/'
end


get '/users/:nick' do 
  user = $users.get(nick: pr[:nick]) || $users.random
  erb :'/users/profile', locals: {user: user}, layout: :layout
end

# settings
get '/settings' do
  erb :'/user_settings/settings_page', locals: {user: cu}, layout: :layout
end

post '/settings' do 
  $users.update_id(cuid,pr)
  flash.message = 'Updated!'
  redirect back
end
# end settings

get '/logout' do
  session.clear
  redirect '/'
end