class Organization < ApplicationRecord
  enum org_type: {
    community_development: 'community_development', 
    education: 'education', 
    religion: 'religion', 
    animals: 'animals', 
    health: 'health', 
    human_rights: 'human_rights', 
    human_services: 'human_services', 
    international: 'international', 
    environment:'environment'
  }

  has_many :donations, dependent: :destroy
end
