require "spec_helper"
describe City do
	before(:each) do
		create(:city)
	end
	describe "Validations" do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:code) }
		it { should validate_presence_of(:country) }
		it { should validate_uniqueness_of(:code) }
	end

	describe "Associations" do
		it { should have_many(:departures) }
		it { should have_many(:arrivals) }
	end
end