require "spec_helper"
describe BankAccount do
	before(:each) do
		create(:bank_account)
	end
	describe "Validations" do
		it { should validate_presence_of(:bank_name) }
		it { should validate_presence_of(:account_name) }
		it { should validate_presence_of(:account_number) }
		it { should validate_presence_of(:bank_name) }
		it { should validate_presence_of(:branch) }
		it { should validate_numericality_of(:account_number) }
		it { should validate_uniqueness_of(:account_number)}
	end
end