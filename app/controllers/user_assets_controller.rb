class UserAssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @assets = UserAsset.where(:user_id => current_user.id)
  end

  def show
  end

  def new
    @asset = current_user.user_assets.build
  end

  def edit
  end

  def create
    puts "SAVING ASSET"
    @asset = current_user.user_assets.build(asset_params)
        puts "SAVING 2"

    if @asset.save
          puts "SAVING 3"

      redirect_to user_assets_url, notice: 'Asset was successfully created!'
    else
          puts "SAVING 4"

      render action: 'new'
    end
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    if @asset.update(asset_params)
      redirect_to user_assets_url, notice: 'Asset was successfully updated!'
    else
      render action: 'edit'
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset.destroy
    redirect_to user_assets_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = UserAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_params
      params.require(:user_asset).permit(:name, :value, :user_id)
    end

    def correct_user
      @asset = current_user.user_assets.find_by(id: params[:id])
      redirect_to user_assets_path, notice: "Not authorized to edit this asset!" if @asset.nil?
    end
end
