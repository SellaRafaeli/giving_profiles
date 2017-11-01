$orgs = $mongo.collection('orgs')

ORG_FIELDS = [:name, :type, :website, :facebook_page]

def create_org(name)
  $orgs.add(name: name)
end

get '/orgs/:id' do
  org = $orgs.get(pr[:id]) || $orgs.random
  erb :'/orgs/org_page', locals: {org: org}, layout: :layout
end

post '/org/:id' do
  $orgs.update_id(pr[:id],pr.just(ORG_FIELDS))
  flash_and_back('Thanks!')
end