module ApplicationHelper
	def state_active(state)
		if state == true
			raw('<span class="label label-success">Active</span>')
		else
			raw('<span class="label label-danger">Not Active</span>')
		end
	end

	def pdf_path(transaction)
		if File.exist?(File.join(Rails.root, "public", "files", transaction.pdf_name))
			root_url + "files/" + transaction.pdf_name
		else
			"#"
		end
	end
end
