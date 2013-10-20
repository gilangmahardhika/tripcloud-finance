require 'spec_helper'
describe Transaction do
	before(:each) do
		create(:admin_user)
		create(:transaction)
		create(:city)
		create(:airline)
	end
	describe "Validation" do
		it { should validate_presence_of(:to_name) }
		it { should validate_presence_of(:address) }
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:invoice_number) }
		it { should validate_presence_of(:issued_date) }
		it { should validate_presence_of(:total_price) }
		it { should validate_presence_of(:to_name) }
		it { should validate_uniqueness_of(:invoice_number) }
	end

	describe "Associations" do
		it { should belong_to(:admin_user) }
		it { should have_many(:paxes) }
	end

	describe "Method" do
		it "Create" do
			transaction = create(:transaction, invoice_number: "2013/tc/3133e")
			expect(:transaction).to be_true
		end

		it "Has Paxes" do
			city = create(:city)
			airline = build(:airline)
			transaction = create(:transaction, invoice_number: "2013/tc/3133e")
			3.times do
				create(:pax, transaction: transaction, departure_id: city.id, arrival_id: city.id)
			end
			transaction.paxes.count.should eq(3)
		end

		it "Get pax name" do
			transaction = create(:transaction, invoice_number: "2013/tc/3133e")
			pax = create(:pax, transaction: transaction, first_name: "Gilang")
			transaction.paxes.last.first_name.should == "Gilang"
		end

		it "Sum total price" do
			
			3.times do
				create(:pax, transaction_id: 1, nett_to_agent: 10000, publish_fare: 12000)
			end
			transaction = create(:transaction, id: 1, total_price: 0, invoice_number: "2013/tc/3133e")
			transaction.total_price.should eq(36000)
		end
	end

	describe "Formatter" do
		it "Format to rupiah" do
			rupiah_convert(1000).should == "Rp 1.000"
		end

		it "Format to IDR" do
			rupiah_convert(1000).should == "IDR 1.000"
		end
	end
end