  $users = $mongo.collection('users')

ALL_NETWORKS = ['yale', 'harvard', 'stanford', 'caltech']
USER_FIELDS  = [:nick,:name,:address,:yearly_income,:network,:philosophy,:fav_orgs,:fav_orgs_text,:fav_cause,:fav_cause_txt]

get '/login/:id' do
  user = $users.get(pr[:id]) || $users.get(nick: pr[:nick]) || $users.random
  session[:user_id] = user[:_id]
  redirect '/'
end

# settings
get '/settings' do
  require_user
  erb :'/user_settings/settings_page', locals: {user: cu}, layout: :layout
end

post '/settings' do 
  params[:fav_orgs]      ||= []
  params[:fav_orgs_text] ||= []
  $users.update_id(cuid,pr)
  flash.message = 'Updated!'
  redirect back
end
# end settings

# get '/login_as' do
#   session[:user_id] = $users.get(pr[:id])['_id']
# end

get '/logout' do
  session.clear
  redirect '/'
end

get '/users/delete_me' do
  $users.update_id(cuid,{deleted:true})
  flash.message = 'You have been deleted from the system.'
  session.clear
  redirect back
end

get '/users/:nick' do 
  user = $users.get(nick: pr[:nick])
  if user['deleted'] 
    flash.message = 'This user has been deleted from the system.'
    redirect '/'
  end
  erb :'/users/profile', locals: {user: user}, layout: :layout
end