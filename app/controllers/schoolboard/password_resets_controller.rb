# schoolboard/controllers/password_resets_controller.rb

class Adminboard::PasswordResetsController < AdminboardController
  skip_before_action :authorize_school
  before_action :check_current_school, only: [:new, :edit]
  before_action :set_school, only: [:edit, :update]

  def new
  end

  def create
    @school = School.find_by_email!(params[:email])
    @school.send_reset_password if @school
    redirect_to schoolboard_root_path
  end

  def edit
  end

  def update
    if @school.reset_password_sent_at < 6.hours.ago
      redirect_to schoolboard_root_path
    elsif @school.update_attributes(school_params)
      redirect_to schoolboard_root_path
    else
      redirect_to edit_schoolboard_password_reset_path
    end
  end

  private

  def check_current_school
    redirect_to schoolboard_root_path if current_school.present?
  end

  def set_school
    @school = School.find_by_reset_password_token!(params[:id])
  end

  def school_params
    params.require(:school).permit(:password, :password_confirmation)
  end
end
