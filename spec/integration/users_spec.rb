require 'spec_helper'

describe "Users" do
	describe "signup" do
		describe "failure" do
		  # I think I need Rails 3 to use webrat
#			lambda do
#				visit signup_path
#				click_button
#				response.should render_template('users/new')
#				response.should have_tag("div#errorExplanation")
#			end.should_not change(User, :count)
		end
	end
end
