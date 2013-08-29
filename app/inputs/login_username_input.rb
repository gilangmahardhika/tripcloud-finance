class LoginUsernameInput < SimpleForm::Inputs::Base
  def input
  	'<i class="icon icon-user"></i>' + \
    @builder.text_field(attribute_name, input_html_options) 
    # @builder.hidden_field(attribute_name, { :class => attribute_name.to_s + "-alt", id: attribute_name.to_s + "-alt"}) 
  end
end