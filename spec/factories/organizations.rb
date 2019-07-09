FactoryBot.define do
  factory :organization do
    name {Faker::Company.unique.name}
    org_type {Organization.org_types.keys.sample}
    fb_url {Faker::Internet.url('facebook.com')}
    location {Faker::Address.state}
  end
end
