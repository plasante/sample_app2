# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all            # include all helpers in all the views but not in the controllers
  protect_from_forgery   # See ActionController::RequestForgeryProtection for details
  include SessionsHelper # We explicitly include the methods from SessionsHelper in both views and controllers

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
end
