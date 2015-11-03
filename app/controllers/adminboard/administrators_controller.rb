class Adminboard::AdministratorsController < AdminboardController
  before_action :set_administrator, only: [:show, :edit, :update, :destroy]

  # GET /adminboard/administrators
  # GET /adminboard/administrators.json
  def index
    redirect_to adminboard_administrator_path(current_administrator) unless current_administrator.sudo?
    @administrators = Administrator.all
  end

  # GET /adminboard/administrators/1
  # GET /adminboard/administrators/1.json
  def show
  end

  # GET /adminboard/administrators/new
  def new
    @administrator = Administrator.new
  end

  # GET /adminboard/administrators/1/edit
  def edit
  end

  # POST /adminboard/administrators
  # POST /adminboard/administrators.json
  def create
    @administrator = Administrator.new(administrator_params)

    respond_to do |format|
      if @administrator.save
        format.html { redirect_to [:adminboard, @administrator], notice: 'Administrator was successfully created.' }
        format.json { render action: 'show', status: :created, location: @administrator }
      else
        format.html { render action: 'new' }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adminboard/administrators/1
  # PATCH/PUT /adminboard/administrators/1.json
  def update
    respond_to do |format|
      if @administrator.update(administrator_params)
        format.html { redirect_to [:adminboard, @administrator], notice: 'Administrator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adminboard/administrators/1
  # DELETE /adminboard/administrators/1.json
  def destroy
    @administrator.destroy
    respond_to do |format|
      format.html { redirect_to adminboard_login_path, notice: 'Administrator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      if current_administrator.sudo?
        @administrator = Administrator.find_by_slug!(params[:id])
      else
        @administrator = current_administrator
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_params
      params.require(:administrator).permit(:slug, :email, :password, :password_confirmation, :sudo)
    end
end
