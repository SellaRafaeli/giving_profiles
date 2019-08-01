require "rails_helper"

RSpec.describe Donation, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:organization) }
#   should be positive amount
#   ordered by created_at descending
#   DonationController
#     - test that @new_donation is available and not null( has user)
#     - sets user before creating/editing/deleting
#     - returns to User Home page after create
end
