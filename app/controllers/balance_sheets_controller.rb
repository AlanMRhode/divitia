class BalanceSheetsController < ApplicationController
  before_action :set_balance_sheet, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /balance_sheets
  # GET /balance_sheets.json
  def index
    @assets = UserAsset.where(:user_id => current_user.id)
    @liabilities = Liability.where(:user_id => current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_balance_sheet
      @balance_sheet = BalanceSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def balance_sheet_params
      params.require(:balance_sheet).permit(:net_assets, :net_liabilities)
    end
end
