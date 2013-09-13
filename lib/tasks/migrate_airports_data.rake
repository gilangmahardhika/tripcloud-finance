namespace :airports do
	desc "Migrate all airports data"
	task :migrate => :environment do
		airports_file = File.read(Rails.root.join("doc/airports.json"))
		airports = JSON.parse(airports_file)
		allowed_countries = ["Indonesia", "Malaysia", "Singapore", "Thailand", "Laos", "Myanmar", "Philippines", "Australia", "Saudi Arabia", "Cambodia", "Vietnam", "Macao", "England", "Netherlands", "Japan", "South Korea"]
		airports.each do |airport|
			if airport["country"].in?(allowed_countries)
				City.create do |city|
					city.name = airport["city"]
					city.airport_name = airport["name"]
					city.country = airport["name"]
					city.code = airport["code"]
				end
			end
		end

		City.find_by_code("CGK").update_attributes(name: "Jakarta")
	end
end