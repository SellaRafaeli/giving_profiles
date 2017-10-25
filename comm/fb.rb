
get '/fb_login' do
  res = http_get_json "https://graph.facebook.com/me?fields=id,name,picture,email&access_token=#{pr[:token]}"
  if (id=res[:id])
    pic_url = res[:picture][:data][:url] rescue "" 
    nick    = res[:name].downcase.gsub(' ','-')
    user = $users.update_id(id,{name: res[:name], nick: nick, fb_id: res[:id], pic_url: pic_url}, {upsert: true})
    session[:user_id] = user[:_id]
    flash.message = "Welcome #{res[:name]}!"
    redirect '/'
  else
    flash.message = 'Could not log in'
    redirect '/'
  end
end