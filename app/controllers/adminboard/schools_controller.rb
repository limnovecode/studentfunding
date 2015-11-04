class Adminboard::SchoolsController < AdminboardController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /adminboard/schools
  # GET /adminboard/schools.json
  def index
    @schools = School.all
  end

  # GET /adminboard/schools/1
  # GET /adminboard/schools/1.json
  def show
  end

  # GET /adminboard/schools/new
  def new
    @school = School.new
  end

  # GET /adminboard/schools/1/edit
  def edit
  end

  # POST /adminboard/schools
  # POST /adminboard/schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to [:adminboard, @school], notice: 'School was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school }
      else
        format.html { render action: 'new' }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adminboard/schools/1
  # PATCH/PUT /adminboard/schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to [:adminboard, @school], notice: 'School was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adminboard/schools/1
  # DELETE /adminboard/schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to adminboard_schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find_by_slug!(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:slug, :title, :description, :email, :password, :password_confirmation, :active)
    end
end
