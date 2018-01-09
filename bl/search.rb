def search_like(coll,term,field)
  return [] unless term.present?
  coll.get_many({field => {"$regex" => Regexp.new(term.to_s, Regexp::IGNORECASE)}}, {limit: 100, sort: [{created_at: -1}]})
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
  if (!pr[:q] && !pr[:type])
    erb :'/search/initial_search', layout: :layout
  else 
    erb :'/search/results', locals: {users: search_users, orgs: search_orgs}, layout: :layout
  end
end

get '/search/orgs' do
  params[:q] ||= pr[:query]
  {suggestions: search_orgs.mapo('name')}
end

get '/search/my_orgs' do
  q= params[:q] ||= pr[:query]
  orgs = my_donated_orgs.mapo('name').select {|name| name.downcase.include?(q.to_s.downcase)}
  {suggestions: orgs}
end

get '/search/ajax' do
  params[:q] ||= pr[:query]
  results = search_users.mapo('name') + search_orgs.mapo('name')
  {suggestions: results}
end