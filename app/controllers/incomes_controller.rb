class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @incomes = Income.where(:user_id => current_user.id)
  end


  def show
  end

  # GET /incomes/new
  def new
    @income = current_user.incomes.build
  end

  # GET /incomes/1/edit
  def edit
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @income = current_user.incomes.build(income_params)
    if @income.save
      redirect_to incomes_url, notice: 'Income was successfully created!'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /incomes/1
  # PATCH/PUT /incomes/1.json
  def update
    if @income.update(income_params)
      redirect_to incomes_url, notice: 'Income was successfully updated!'
    else
      render action: 'edit'
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income.destroy
    redirect_to incomes_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_params
      params.require(:income).permit(:name, :value, :user_id)
    end

    def correct_user
      @income = current_user.incomes.find_by(id: params[:id])
      redirect_to incomes_path, notice: "Not authorized to edit this income!" if @income.nil?
    end

end
