$orgs = $mongo.collection('orgs')

ORG_FIELDS = [:name, :type, :url, :facebook_page]

def create_org(name)
  $orgs.add(name: name)
end

def org_donors(org)
  other_donors_ids = $donations.all(org_id: org[:_id]).mapo('user_id')
  other_donors     = $users.get_many(_id: {'$in': other_donors_ids})
  other_donors
end

get '/orgs/:id' do
  org = $orgs.get(pr[:id]) || $orgs.random
  erb :'/orgs/org_page', locals: {org: org}, layout: :layout
end

post '/org/:id' do
  $orgs.update_id(pr[:id],pr.just(ORG_FIELDS))
  flash_and_back('Thanks!')
end