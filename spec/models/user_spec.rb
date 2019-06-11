require "rails_helper"

RSpec.describe User, type: :model do
  subject { users(:bob_user) }

  it { should define_enum_for(:favorite_cause).backed_by_column_of_type(:string) }

  it { should have_many(:user_favorite_organizations).dependent(:destroy) }
  it { should have_many(:donations).dependent(:destroy) }
  it do
    should have_many(:favorite_organizations)
      .through(:user_favorite_organizations)
      .source(:organization)
  end

  it "should validate that email is case-sensitively unique" do
    user = users(:bob_user)
    new_user = User.new(first_name: "John", last_name: "Doe", email: user.email)
    expect(new_user.valid?).to be_falsey
    new_user.update_attribute(:email, user.email.upcase)
    expect(new_user.valid?).to be_falsey
  end

  describe "#name" do 
    it "returns first_name plus last name with space in between." do 
      user = users(:bob_user)
      expect(user.name).to eql "Bob Bobson"
    end
  end

end
