require 'active_support/concern'
module Modules
	module HasAdminUser	
		extend ActiveSupport::Concern

		included do
			attr_accessible :admin_user_id
			validates_presence_of :admin_user_id
		end
	end	
end