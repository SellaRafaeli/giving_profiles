module DonationService

  # Creates a user donation to an organization
  #
  # @param [User] user that is making the donation
  # @param [Organization] organization that is receiving the donation
  # @param [Integer] amount in USD that is being donated
  # @return [Donation] donation that was created if successful and nil if failed
  def create_donation(user, organization, amount)
    # TODO: Implement Code Here
  end
end
