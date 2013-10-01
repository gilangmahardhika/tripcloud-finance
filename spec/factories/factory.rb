FactoryGirl.define do

	sequence :email do |n|
		"admin#{n}@tripclouds.com"
	end
	sequence :username do |n|
		"username#{n}"
	end

	sequence :date do
		[1..10].sample.to_i.years.ago
	end

	sequence :boolean do
		[true, false].sample
	end

	sequence :invoice_number do |n|
		"2013/tc/#{n}"
	end

	sequence :role do
		["admin", "finance"].sample.to_s
	end

	sequence :code do
		alpha = ("A".."Z").to_a
		numeric = (0..90).to_a
		alpha.zip(numeric).flatten.compact.sample(2).join
	end

	sequence :booking_code do
		alpha = ("A".."Z").to_a
		numeric = (0..90).to_a
		alpha.zip(numeric).flatten.compact.sample(6).join
	end

	factory :admin_user do
		name "Gilang"
		username
		email
		password "some_password"
		password_confirmation "some_password"
		phone "08111015651"
		role
		active true
	end

	factory :transaction do
		to_name "Gilang"
		email
		invoice_number :invoice_number
		personal :boolean
		company "OntelStudio"
		admin_user
		address "Yogyakarta"
		issued_date :date
		time_limit :date
		nett_to_agent 12000
		total_price 20000
	end

	factory :airline do
		name "Garuda"
		code
	end

	factory :city do
		name "Yogyakarta"
		code
		country "Indonesia"
		airport_name "Adisucipto"
	end

	factory :bank_account do
		bank_name "BCA"
		account_name "Gilang"
		account_number "1691922303"
		branch "Ahmad Dahlan Jogja"
	end

	factory :pax do
		title { ["Mr", "Mrs", "Ms", "Child", "Infant"].sample.to_s }
		first_name "Gilang"
		middle_name "Putera"
		last_name "Mahardhika"
		transaction
		departure_id 1
		arrival_id 1
		route {["One way", "Return"].sample.to_s}
		departure_date :date
		arrival_date :date
		airline
		booking_code
		flight_number "GA123"
		nett_to_agent 12000
		publish_fare 20000
	end
end