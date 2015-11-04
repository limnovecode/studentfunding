class Schoolboard::ReceiptsController < SchoolboardController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  def index
    @receipts = Receipt.includes(:store).approved_all
  end

  def pending
    @receipts = Receipt.includes(:store).pending_all
  end

  def conflict
    @receipts = Receipt.includes(:store).conflict_all
  end

  def rejected
    @receipts = Receipt.includes(:store).rejected_all
  end

  def show
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)

    if @receipt.save
      @receipt.update_attributes(
        school_id: current_school.id,
        percentage: (@receipt.store.percentage * @receipt.amount).floor(2),
        status: "pending"
      )
      flash[:success] = "Receipt was successfully created."
      redirect_to schoolboard_receipts_path
    else
      flash.now[:failure] = "Oops. Something went wrong."
      render action: "new"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find_by_slug!(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(:school_id, :store_id, :reference, :amount, :percentage, :purchased, :status)
    end
end
