FactoryBot.define do
  factory :organization do
    name { Faker::Company.unique.name }
    org_type { Organization.org_types.keys.sample }
    fb_url {"https://facebook.com/fakeorg"}
    location {"Evanston, IL"}
  end
end
