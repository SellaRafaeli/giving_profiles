require "rails_helper"

RSpec.describe Organization, type: :model do
  it {should have_many(:donations).dependent(:destroy)}

  describe "Searching" do
    let!(:organization) {create :organization}

    it "return results if there are matches " do
      name_result = PgSearch.multisearch(organization.name)
      org_type_result = PgSearch.multisearch(organization.org_type)
      location_result = PgSearch.multisearch(organization.location)

      expect(name_result.first.searchable.name).to eq organization.name
      expect(org_type_result.first.searchable.org_type).to eq organization.org_type
      expect(location_result.first.searchable.location).to eq organization.location
      expect(location_result.first.searchable.id).to eq organization.id

    end

    it "does NOT return results if there are no matches" do
      result = PgSearch.multisearch("Not There")

      expect(result.empty?).to be true
    end
  end
end
