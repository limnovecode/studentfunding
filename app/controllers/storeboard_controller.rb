# controllers/storeboard_controller.rb

class StoreboardController < ApplicationController
  # before_action :authorize_store
  layout :layout_to_render

  private

  # Defines the layout based on the store agent.
  def layout_to_render
    if browser.modern?
      "storeboard/application"
    else
      "storeboard/application"
    end
  end

  # Setup the current_store method.
  def current_store
    @current_store ||= Store.find_by_authentication_token!(session[:authentication_token]) if session[:authentication_token]
  end

  # Verifies if the Store is Logged in or not.
  def authorize_store
    redirect_to storeboard_login_path if current_store.nil?
  end

  # Creates the current_store.
  helper_method :current_store
end
