class ResourceLinksController < ApplicationController
  before_action :set_platform
  before_action :set_resource_link, only: %i[ show edit update destroy ]

  # GET /resource_links or /resource_links.json
  def index
    @resource_links = ResourceLink.all
  end

  # GET /resource_links/1 or /resource_links/1.json
  def show
    if params[:nonce].present?
      @tool_params = Jwt.get_jwt_details(params[:tool_state])
      @claims_hash = Jwt.create_claims_hash(@tool_params, @resource_link.id, @platform.id)
      # puts('__________')
      @json_claims = Jwt.json_claims(@claims_hash)
      # puts('__________')
      @jwt = Jwt.create_jwt(@json_claims, @platform.id)

    end
  end

  # GET /resource_links/new
  def new
    @resource_link = ResourceLink.new
    # @resouce_link.context = @platform.contexts
  end

  # GET /resource_links/1/edit
  def edit
    @resouce_link.contexts = @platform.contexts
  end

  # POST /resource_links or /resource_links.json
  def create
    @resource_link = ResourceLink.new(resource_link_params)

    respond_to do |format|
      if @resource_link.save
        format.html { redirect_to platform_resource_link_url(@platform, @resource_link), notice: "Resource link was successfully created." }
        format.json { render :show, status: :created, location: @resource_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resource_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resource_links/1 or /resource_links/1.json
  def update
    respond_to do |format|
      if @resource_link.update(resource_link_params)
        format.html { redirect_to platform_resource_link_url(@platform, @resource_link), notice: "Resource link was successfully updated." }
        format.json { render :show, status: :ok, location: @resource_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resource_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_links/1 or /resource_links/1.json
  def destroy
    @resource_link.destroy

    respond_to do |format|
      format.html { redirect_to platform_resource_links_url(@platform), notice: "Resource link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_link
      @resource_link = ResourceLink.find(params[:id])
    end

    def set_platform
      @platform = Platform.find(params[:platform_id])
    end


    # Only allow a list of trusted parameters through.
    def resource_link_params
      params.require(:resource_link).permit(:title, :description, :tool_link_url, :login_url, :role, :context_id, :platform_id)
    end
end
