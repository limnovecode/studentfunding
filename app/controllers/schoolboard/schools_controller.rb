class Schoolboard::SchoolsController < SchoolboardController
  before_action :set_school, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @school.update(school_params)
      flash[:success] = "School was successfully updated."
      redirect_to schoolboard_school_path
    else
      flash.now[:failure] = "Oops. Something went wrong."
      render action: 'edit'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = current_school
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:password, :password_confirmation)
    end
end
