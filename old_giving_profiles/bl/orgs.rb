if $prod
$orgs = $mongo.collection('orgs2')
else
$orgs = $mongo.collection('orgs')
end

$private_orgs = $mongo.collection('private_orgs')


$orgs.ensure_index('name') rescue nil
ORG_FIELDS = [:name, :type, :url, :facebook_page]

ORG_TYPES = ['community_development', 'education', 'religion', 'animals', 'health', 'human_rights', 'human_services', 'international', 'environment', ] 

def create_org(name)
  $orgs.add(name: name)
end

def org_donors(org)
  other_donors_ids = $donations.all(org_id: org[:_id], private: {'$ne': true}).mapo('user_id')
  other_donors     = $users.get_many(_id: {'$in': other_donors_ids})
  other_donors.reject! {|user| next if user == cu; is_org_private(org,user)}  
  other_donors
end

def is_org_id_private(org_id,user)
  user = {'_id' => user } if user.is_a? String
  id = "#{user['_id']}_#{org_id}"
  $private_orgs.get(id)
end

def is_org_private(org,user)
  is_org_id_private(org['_id'],user)
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

post '/orgs/make_private/:id' do
  id = "#{cuid}_#{pr[:id]}"
  pr[:private].to_s=="true" ? $private_orgs.update_id(id,{},{upsert:true}) : $private_orgs.delete_one({_id: id})
  {msg: "ok"}
end

post '/orgs/add' do
  halt unless is_admin
  org = $orgs.add(name: pr[:name])
  redirect ("/orgs/#{org[:_id]}")
end

post '/orgs/:id' do
  $orgs.update_id(pr[:id],pr.just(ORG_FIELDS))
  flash_and_back('Thanks!')
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