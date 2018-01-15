get '/faq' do
  erb :'other/faq', default_layout
end

get '/contact' do
  erb :'other/contact', default_layout
end

post '/submit_comment' do 
  flash.message='Thanks!'
  redirect back
end