class PlatformKeysController < ApplicationController
  before_action :set_platform
  before_action :set_platform_key, only: %i[ show edit update destroy ]

  # GET /platform_keys or /platform_keys.json
  def index
    @platform_keys = PlatformKey.all
  end

  # GET /platform_keys/1 or /platform_keys/1.json
  def show
  end

  # GET /platform_keys/new
  def new
    @platform_key = PlatformKey.new
  end

  # GET /platform_keys/1/edit
  def edit
  end

  # POST /platform_keys or /platform_keys.json
  def create
    @platform_key = PlatformKey.new(platform_key_params)

    respond_to do |format|
      if @platform_key.save
        format.html { redirect_to platform_platform_key_url(@platform, @platform_key), notice: "Platform key was successfully created." }
        format.json { render :show, status: :created, location: @platform_key }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @platform_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platform_keys/1 or /platform_keys/1.json
  def update
    respond_to do |format|
      if @platform_key.update(platform_key_params)
        format.html { redirect_to platform_platform_key_url(@platform, @platform_key), notice: "Platform key was successfully updated." }
        format.json { render :show, status: :ok, location: @platform_key }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @platform_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platform_keys/1 or /platform_keys/1.json
  def destroy
    @platform_key.destroy

    respond_to do |format|
      format.html { redirect_to platform_platform_keys_path(@platform), notice: "Platform key was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform_key
      @platform_key = PlatformKey.find(params[:id])
    end

    def set_platform
      @platform = Platform.find(params[:platform_id])
    end

    # Only allow a list of trusted parameters through.
    def platform_key_params
      params.require(:platform_key).permit(:name, :deployment_id, :platform_id)
    end
end