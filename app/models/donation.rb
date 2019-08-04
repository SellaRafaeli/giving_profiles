# frozen_string_literal: true

class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  def self.all_newest_first
    # code here
  end
end
