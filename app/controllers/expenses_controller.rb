class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @expenses = Expense.where(:user_id => current_user.id)
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = current_user.expenses.build
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      redirect_to expenses_url, notice: 'Expense was successfully created!'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    if @expense.update(expense_params)
      redirect_to expenses_url, notice: 'Expense was successfully updated!'
    else
      render action: 'edit'
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    redirect_to expenses_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:name, :value, :user_id)
    end

    def correct_user
      @expense = current_user.expenses.find_by(id: params[:id])
      redirect_to expenses_path, notice: "Not authorized to edit this expense!" if @expense.nil?
    end
end
