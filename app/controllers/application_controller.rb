class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :valid_session

  def valid_session
    return if logged_in?

    redirect_to login_path
  end
end
