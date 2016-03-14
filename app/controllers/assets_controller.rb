class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /assets
  # GET /assets.json
  def index
    @assets = Asset.where(:user_id => current_user.id)
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
  end

  # GET /assets/new
  def new
    @asset = current_user.assets.build
  end

  # GET /assets/1/edit
  def edit
  end

  def create
    @asset = current_user.assets.build(asset_params)
    if @asset.save
      redirect_to assets_url, notice: 'Asset was successfully created!'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    if @asset.update(asset_params)
      redirect_to assets_url, notice: 'Asset was successfully updated!'
    else
      render action: 'edit'
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset.destroy
    redirect_to assets_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_params
      params.require(:asset).permit(:name, :value, :user_id)
    end

    def correct_user
      @asset = current_user.assets.find_by(id: params[:id])
      redirect_to assets_path, notice: "Not authorized to edit this asset!" if @asset.nil?
    end
end
