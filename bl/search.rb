get '/search' do
  results = $users.all
  erb :'/search/results', locals: {items: results}, layout: :layout
end