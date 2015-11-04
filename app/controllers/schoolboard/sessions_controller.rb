# schoolboard/controllers/sessions_controller.rb

class Schoolboard::SessionsController < SchoolboardController
  skip_before_action :authorize_school

  def new
    # redirect_to schoolboard_root_path if current_admin.present?
  end

  def create
    school = School.find_by_email(params[:email])
    if school && school.authenticate(params[:password])
      session[:authentication_token] = school.authentication_token
      redirect_to schoolboard_root_url
    else
      redirect_to schoolboard_login_path
    end
  end

  def destroy
    session[:authentication_token] = nil
    redirect_to root_path if session.destroy
  end
end
