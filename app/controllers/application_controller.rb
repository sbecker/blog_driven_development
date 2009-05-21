# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :set_browser_title
  def set_browser_title
    @browser_title = "Blog Driven Development"
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
