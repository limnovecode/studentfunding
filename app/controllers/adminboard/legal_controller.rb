class Adminboard::LegalController < AdminboardController
  before_action :set_legal, only: [:show, :edit, :update, :destroy]

  # GET /adminboard/legal
  # GET /adminboard/legal.json
  def index
    @legal = Legal.all
  end

  # GET /adminboard/legal/1
  # GET /adminboard/legal/1.json
  def show
  end

  # GET /adminboard/legal/new
  def new
    @legal = Legal.new
  end

  # GET /adminboard/legal/1/edit
  def edit
  end

  # POST /adminboard/legal
  # POST /adminboard/legal.json
  def create
    @legal = Legal.new(legal_params)

    respond_to do |format|
      if @legal.save
        format.html { redirect_to [:adminboard, @legal], notice: 'Legal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @legal }
      else
        format.html { render action: 'new' }
        format.json { render json: @legal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adminboard/legal/1
  # PATCH/PUT /adminboard/legal/1.json
  def update
    respond_to do |format|
      if @legal.update(legal_params)
        format.html { redirect_to [:adminboard, @legal], notice: 'Legal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @legal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adminboard/legal/1
  # DELETE /adminboard/legal/1.json
  def destroy
    @legal.destroy
    respond_to do |format|
      format.html { redirect_to adminboard_legal_url, notice: 'Legal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal
      @legal = Legal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legal_params
      params.require(:legal).permit(:title, :active)
    end
end
