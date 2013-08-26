class Ability
	include Cancan::Ability

	def initialize(usr)
		@usr = usr || AdminUser.new
		if @user.role == "admin"
			can :manage, :all
		end
	end
end