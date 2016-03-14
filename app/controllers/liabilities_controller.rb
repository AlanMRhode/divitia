class LiabilitiesController < ApplicationController
  before_action :set_liability, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /liabilities
  # GET /liabilities.json
  def index
    @liabilities = Liability.where(:user_id => current_user.id)
  end

  # GET /liabilities/1
  # GET /liabilities/1.json
  def show
  end

  # GET /liabilities/new
  def new
    @liability = current_user.liabilities.build
  end

  # GET /liabilities/1/edit
  def edit
  end

  def create
    @liability = current_user.liabilities.build(liability_params)
    if @liability.save
      redirect_to liabilities_url, notice: 'Liability was successfully created!'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /liabilities/1
  # PATCH/PUT /liabilities/1.json
  def update
    if @liability.update(liability_params)
      redirect_to liabilities_url, notice: 'Liability was successfully updated!'
    else
      render action: 'edit'
    end
  end

  # DELETE /liabilities/1
  # DELETE /liabilities/1.json
  def destroy
    @liability.destroy
    redirect_to liabilities_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liability
      @liability = Liability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liability_params
      params.require(:liability).permit(:name, :value, :user_id)
    end

    def correct_user
      @liability = current_user.liabilities.find_by(id: params[:id])
      redirect_to liabilities_path, notice: "Not authorized to edit this liability!" if @liability.nil?
    end
end
