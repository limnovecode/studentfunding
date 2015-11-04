class Adminboard::StoresController < AdminboardController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /adminboard/stores
  # GET /adminboard/stores.json
  def index
    @stores = Store.all
  end

  # GET /adminboard/stores/1
  # GET /adminboard/stores/1.json
  def show
  end

  # GET /adminboard/stores/new
  def new
    @store = Store.new
  end

  # GET /adminboard/stores/1/edit
  def edit
  end

  # POST /adminboard/stores
  # POST /adminboard/stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to [:adminboard, @store], notice: 'Store was successfully created.' }
        format.json { render action: 'show', status: :created, location: @store }
      else
        format.html { render action: 'new' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adminboard/stores/1
  # PATCH/PUT /adminboard/stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to [:adminboard, @store], notice: 'Store was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adminboard/stores/1
  # DELETE /adminboard/stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to adminboard_stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:title, :description, :percentage, :active)
    end
end
