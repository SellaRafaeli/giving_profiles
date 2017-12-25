$orgs = $mongo.collection('orgs')

$orgs.ensure_index('name') rescue nil
ORG_FIELDS = [:name, :type, :url, :facebook_page]

ORG_TYPES = ['community_development', 'education', 'religion', 'animals', 'health', 'human_rights', 'human_services', 'international', 'environment', ] 

def create_org(name)
  $orgs.add(name: name)
end

def org_donors(org)
  other_donors_ids = $donations.all(org_id: org[:_id]).mapo('user_id')
  other_donors     = $users.get_many(_id: {'$in': other_donors_ids})
  other_donors
end

get '/orgs/:id' do
  org = $orgs.get(pr[:id]) 
  flash_and_back('No such organization') if !org
  erb :'/orgs/org_page', locals: {org: org}, layout: :layout
end

get '/orgs/edit/:id' do
  org = $orgs.get(pr[:id]) 
  erb :'/orgs/edit_org_page', locals: {org: org}, layout: :layout
end


post '/orgs/:id' do
  $orgs.update_id(pr[:id],pr.just(ORG_FIELDS))
  flash_and_back('Thanks!')
end

post '/orgs/add' do
  halt unless is_admin
  org = $orgs.add(name: pr[:name])
  redirect ("/orgs/#{org[:_id]}")
end

get '/set_all_from_amazon' do
  before = Time.now
  #(https://s3.amazonaws.com/irs-form-990/index_2015.json)
  route ='https://s3.amazonaws.com/irs-form-990/index_2015.json';
  data  = JSON.parse(RestClient.get(route));
  org_names  = data["Filings2015"].mapo('OrganizationName')#[0..100_000];
  num   = org_names.size
  $orgs.delete_many;
  org_names.each {|name| $orgs.add(name: name)}; org_names.size
  {num_orgs: $orgs.count, random: $orgs.random, time_took: Time.now-before}
end