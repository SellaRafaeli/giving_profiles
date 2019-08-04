require "rails_helper"

RSpec.describe Donation, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:organization) }

#   should be positive amount
  it "should have a positive amount" do
    organization = create :organization
    user = create :user
    donation = Donation.new(user: user, organization: organization, amount: 1)

    expect(donation).to be_valid

    donation.update_attribute(:amount, -1)

    expect(donation).not_to be_valid
  end

  it "should have an amount" do
    organization = create :organization
    user = create :user
    donation = Donation.new(user: user, organization: organization)

    expect(donation).not_to be_valid
  end

#   ordered by created_at descending
#   DonationController
#     - test that @new_donation is available and not null( has user)
#     - sets user before creating/editing/deleting
#     - returns to User Home page after create
end
