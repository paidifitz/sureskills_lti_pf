class ConnectsController < ApplicationController
  before_action :set_platform
  before_action :set_resource_link

  # GET /resource_links or /resource_links.json
  def index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_link
      @resource_link = ResourceLink.find(params[:resource_link_id])
    end

    def set_platform
      @platform = Platform.find(params[:platform_id])
    end
end