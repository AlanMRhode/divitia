require 'test_helper'

class BudgetsControllerTest < ActionController::TestCase
  setup do
    @budget = budgets(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create budget" do
    assert_difference('Budget.count') do
      post :create, budget: { Net_Expense: @budget.Net_Expense, Net_Income: @budget.Net_Income, expense_id: @budget.expense_id, income_id: @budget.income_id }
    end

    assert_redirected_to budget_path(assigns(:budget))
  end

  test "should show budget" do
    get :show, id: @budget
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @budget
    assert_response :success
  end

  test "should update budget" do
    patch :update, id: @budget, budget: { Net_Expense: @budget.Net_Expense, Net_Income: @budget.Net_Income, expense_id: @budget.expense_id, income_id: @budget.income_id }
    assert_redirected_to budget_path(assigns(:budget))
  end

  test "should destroy budget" do
    assert_difference('Budget.count', -1) do
      delete :destroy, id: @budget
    end

    assert_redirected_to budgets_path
  end
end
