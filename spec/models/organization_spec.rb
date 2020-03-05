require "rails_helper"
RSpec.describe Organization, type: :model do
  it {should have_many(:donations).dependent(:destroy)}

  describe "Searching" do
    let(:organization) {create :organization, name: Faker::Company::name}

    it "return results if there are matches " do
      name_result = PgSearch.multisearch(organization.name)
      org_type_result = PgSearch.multisearch(organization.org_type)
      location_result = PgSearch.multisearch(organization.location)

      expect(name_result.present?).to be true
      expect(name_result.map(&:searchable).include?(organization)).to be true

      expect(org_type_result.present?).to be true
      expect(org_type_result.map(&:searchable).include?(organization)).to be true

      expect(location_result.present?).to be true
      expect(location_result.map(&:searchable).include?(organization)).to be true
    end

    it "does NOT return results if there are no matches" do
      result = PgSearch.multisearch("Not There")

      expect(result.empty?).to be true
    end
  end
end
