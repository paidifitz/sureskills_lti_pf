class PlatformsController < ApplicationController
  before_action :load_platform, only: %i[show edit update destroy]

  def index
    @platforms = Platform.order(updated_at: :desc)
  end

  def new
    @platform = Platform.new
  end

  def create
    @platform = Platform.new(platform_params)
    if @platform.save
      redirect_to platforms_path, success: 'Platform was successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @platform.update(platform_params)
      redirect_to platforms_path, success: 'Platform was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @platform.destroy
    redirect_to platforms_path, notice: 'Platform was successfully deleted.'
  end

  private

  def platform_params
    params.require(:platform).permit(:name, :client, :audience, :public_key, :private_key, :tool_public_key, :jwt_url)
  end

  def load_platform
    @platform = Platform.find(params[:id])
  end
end
