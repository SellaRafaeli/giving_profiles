# frozen_string_literal: true

class UserFavoriteOrganization < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  validates :user_id, uniqueness: { scope: :organization_id }
end
