$users = $mongo.collection('users')

USER_FIELDS = [:nick,:name,:address,:philosophy,:fav_org,:fav_org_text,:fav_cause]

def reset_all
  $users.delete_many
  ['Matt A.','John Doe','Jane Doe'].each {|name|
    $users.add(name: name, nick: name, address: 'Some address')
  }

  $orgs.delete_many
  ['Red Cross', 'Doctors Without Borders', 'Make a Wish Foundation'].each {|name|
    create_org(name)
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