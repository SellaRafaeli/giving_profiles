# frozen_string_literal: true

class Organization < ApplicationRecord
  include PgSearch
  multisearchable against: %i[name org_type location],
                  update_if: %i[name_changed? org_type_changed? location_changed?]

  enum org_type: {
    animals: "animals",
    community: "community",
    education: "education",
    environment: "environment",
    health: "health",
    human_rights: "human_rights",
    human_services: "human_services",
    international: "international",
    religion: "religion"
  }

  has_many :donations, dependent: :destroy
end
