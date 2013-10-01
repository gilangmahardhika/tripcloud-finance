require 'spec_helper'
describe AdminUser do
	before(:each) do
		create(:admin_user)
	end

	describe "Validations" do
		it { should have_secure_password }
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:username) }
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:active) }
		it { should validate_presence_of(:role) }
		it { should ensure_inclusion_of(:role).in_array(["admin", "finance"]) }
		it { should validate_presence_of(:password).on(:create) }
		it { should validate_confirmation_of(:password).on(:create) }
		it { should validate_presence_of(:phone) }
		it { should validate_uniqueness_of(:email) }
		it { should validate_uniqueness_of(:username) }
	end

	describe "Associations" do
		it { should have_many(:transactions) }
	end

	describe "Login" do
		it "can login" do
			user = create(:admin_user, username: "test")
			login = AdminUser.find_by_username("test")
			login.authenticate("some_password").should be_true
		end

		it "can't login" do
			user = create(:admin_user, username: "test")
			login = AdminUser.find_by_username("test")
			login.authenticate("password").should be_false
		end
	end
end