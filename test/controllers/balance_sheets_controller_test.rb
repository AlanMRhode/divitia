require 'test_helper'

class BalanceSheetsControllerTest < ActionController::TestCase
  setup do
    @balance_sheet = balance_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:balance_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create balance_sheet" do
    assert_difference('BalanceSheet.count') do
      post :create, balance_sheet: { net_assets: @balance_sheet.net_assets, net_liabilities: @balance_sheet.net_liabilities }
    end

    assert_redirected_to balance_sheet_path(assigns(:balance_sheet))
  end

  test "should show balance_sheet" do
    get :show, id: @balance_sheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @balance_sheet
    assert_response :success
  end

  test "should update balance_sheet" do
    patch :update, id: @balance_sheet, balance_sheet: { net_assets: @balance_sheet.net_assets, net_liabilities: @balance_sheet.net_liabilities }
    assert_redirected_to balance_sheet_path(assigns(:balance_sheet))
  end

  test "should destroy balance_sheet" do
    assert_difference('BalanceSheet.count', -1) do
      delete :destroy, id: @balance_sheet
    end

    assert_redirected_to balance_sheets_path
  end
end
