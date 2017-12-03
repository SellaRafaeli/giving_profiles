def search_like(coll,term,field)
  return [] unless term.present?
  coll.get_many({field => {"$regex" => Regexp.new(term.to_s, Regexp::IGNORECASE)}}, {limit: 100})
end

def search_users
  search_like($users,pr[:q],:name)
end

def search_orgs
  res = []
  res+= search_like($orgs,pr[:q],:name)                if pr[:q]    
  res+=$orgs.get_many({type: pr[:type]}, {limit: 300}) if pr[:type] 
  res
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