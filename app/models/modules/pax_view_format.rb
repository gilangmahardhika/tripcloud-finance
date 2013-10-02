module Modules
	module PaxViewFormat
		def full_name
		  "#{self.title}. #{self.first_name} #{self.middle_name} #{self.last_name}"
		end

		def arrival_date_formatted
		  self.arrival_date.strftime("%d %b %Y") unless self.arrival_date.nil?
		end

		def departure_date_formatted
		  self.departure_date.strftime("%d %b %Y") 
		end

		def publish_fare_formatted
		  "IDR #{self.number_with_delimiter(self.publish_fare, delimiter: ".", separator: ",")}"
		end

		def total_price_formatted
		  "IDR #{self.number_with_delimiter(self.publish_fare, delimiter: ".", separator: ",")}"
		end
	end
end