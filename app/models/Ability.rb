class Ability
	include CanCan::Ability

	def initialize(usr)
		@user = usr || AdminUser.new
		if @user.role == "admin"
			can :manage, :all
		end
	end
end