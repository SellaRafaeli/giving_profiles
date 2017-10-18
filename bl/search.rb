get '/search' do
  users = $users.all 
  orgs  = $orgs.all
  erb :'/search/results', locals: {users: users, orgs: orgs}, layout: :layout
end