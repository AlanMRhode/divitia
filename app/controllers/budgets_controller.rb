class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /budgets
  # GET /budgets.json
  def index
    @incomes = Income.where(:user_id => current_user.id)
    @expenses = Expense.where(:user_id => current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:Net_Income, :Net_Expense, :income_id, :expense_id)
    end
end
