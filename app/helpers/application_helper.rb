module ApplicationHelper
	def state_active(state)
		if state == true
			raw('<span class="label label-success">Active</span>')
		else
			raw('<span class="label label-danger">Not Active</span>')
		end
	end
end
