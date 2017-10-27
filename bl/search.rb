def search_like(coll,term,field)
  coll.get_many(field => {"$regex" => Regexp.new(term.to_s, Regexp::IGNORECASE)})
end

get '/search' do
  users = search_like($users,pr[:q],:name)
  orgs  = search_like($orgs,pr[:q],:name)
  erb :'/search/results', locals: {users: users, orgs: orgs}, layout: :layout
end

get '/search/ajax' do
  params[:q] = pr[:query]
  users = search_like($users,pr[:q],:name).mapo('name')
  orgs  = search_like($orgs,pr[:q],:name).mapo('name')
  results = users + orgs
  
  {suggestions: results}
end