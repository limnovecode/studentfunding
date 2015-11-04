require 'test_helper'

class Schoolboard::ReceiptsControllerTest < ActionController::TestCase
  setup do
    @receipt = receipts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receipt" do
    assert_difference('Receipt.count') do
      post :create, receipt: { amount: @receipt.amount, purchased: @receipt.purchased, reference: @receipt.reference, school_id: @receipt.school_id, status: @receipt.status, store_id: @receipt.store_id }
    end

    assert_redirected_to schoolboard_receipt_path(assigns(:receipt))
  end

  test "should show receipt" do
    get :show, id: @receipt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receipt
    assert_response :success
  end

  test "should update receipt" do
    patch :update, id: @receipt, receipt: { amount: @receipt.amount, purchased: @receipt.purchased, reference: @receipt.reference, school_id: @receipt.school_id, status: @receipt.status, store_id: @receipt.store_id }
    assert_redirected_to schoolboard_receipt_path(assigns(:receipt))
  end

  test "should destroy receipt" do
    assert_difference('Receipt.count', -1) do
      delete :destroy, id: @receipt
    end

    assert_redirected_to schoolboard_receipts_path
  end
end
