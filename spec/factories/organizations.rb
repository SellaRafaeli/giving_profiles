FactoryBot.define do
  factory :organization do
    name { Faker::Company.unique.name }
    org_type { Organization.org_types.keys.sample }
  end
end