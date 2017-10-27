def search_like(coll,term,field)
  coll.get_many(field => {"$regex" => Regexp.new(term.to_s, Regexp::IGNORECASE)})
end

def search_users
  search_like($users,pr[:q],:name)
end

def search_orgs
  search_like($orgs,pr[:q],:name)
end

get '/search' do
  erb :'/search/results', locals: {users: search_users, orgs: search_orgs}, layout: :layout
end

get '/search/orgs' do
  params[:q] ||= pr[:query]
  {suggestions: search_orgs.mapo('name')}
end

get '/search/ajax' do
  params[:q] ||= pr[:query]
  results = search_users.mapo('name') + search_orgs.mapo('name')  
  {suggestions: results}
end