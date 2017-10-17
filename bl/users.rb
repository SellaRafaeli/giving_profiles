$users = $mongo.collection('users')

USER_FIELDS = [:nick,:name,:address]

def set_users
  $users.delete_many
  ['Joe','Jack','Sally'].each {|name|
    $users.add(name: name, nick: name, address: 'Some address')
  }
end

get '/login/:nick' do
  user = $users.get(nick: pr[:nick])
  session[:user_id] = user[:_id]
  redirect '/'
end


get '/users/:nick' do 
  erb :'/users/profile', locals: {user: $users.get(nick: pr[:nick])}, layout: :layout
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