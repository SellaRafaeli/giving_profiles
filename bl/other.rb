get '/faq' do
  erb :'other/faq', default_layout
end

get '/contact' do
  erb :'other/contact', default_layout
end

post '/submit_comment' do 
  flash.message='Thanks!'
  Thread.new {
    to   = 'sella.rafaeli@gmail.com'
    subj = "New Comment on GivingProfiles.org (#{Time.now})"
    html_body = "The following was left by #{pr[:name]} (#{pr[:email]}) on givingprofiles.org: #{pr[:feedback]}"
    send_email(to, subj, html_body)
    #send_email
  }
  redirect back
end