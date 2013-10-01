require "spec_helper"
describe Pax do
	describe "Validation" do
		it { should validate_presence_of(:first_name) }
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:last_name) }
		it { should ensure_inclusion_of(:title).in_array(["Mr", "Mrs", "Ms", "Child", "Infant"])}
		it { should validate_presence_of(:booking_code) }
		it { should validate_presence_of(:arrival_id) }
		it { should validate_presence_of(:departure_id) }
		it { should validate_presence_of(:airline_id) }
		it { should validate_presence_of(:departure_date) }
		it { should validate_presence_of(:transaction_id) }
		it { should validate_numericality_of(:transaction_id) }
		it { should validate_numericality_of(:departure_id) }
		it { should validate_numericality_of(:arrival_id) }
		it { should validate_numericality_of(:airline_id) }
		it { should validate_presence_of(:nett_to_agent) }
		it { should validate_presence_of(:publish_fare) }
		it { should validate_presence_of(:route) }
		it { should ensure_inclusion_of(:route).in_array(["One way", "Return"])}
	end

	describe "Associations" do
		it { should belong_to :transaction }
		it { should belong_to :departure }
		it { should belong_to :arrival }
		it { should belong_to :airline }
	end
end