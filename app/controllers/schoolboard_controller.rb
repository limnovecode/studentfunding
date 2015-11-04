# controllers/schoolboard_controller.rb

class SchoolboardController < ApplicationController
  before_action :authorize_school
  layout :layout_to_render

  private

  # Defines the layout based on the school agent.
  def layout_to_render
    if browser.modern?
      "schoolboard/application"
    else
      "schoolboard/application"
    end
  end

  # Setup the current_school method.
  def current_school
    @current_school ||= School.find_by_authentication_token!(session[:authentication_token]) if session[:authentication_token]
  end

  # Verifies if the School is Logged in or not.
  def authorize_school
    redirect_to schoolboard_login_path if current_school.nil?
  end

  # Creates the current_school.
  helper_method :current_school
end
