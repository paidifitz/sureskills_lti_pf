class AuthorizationsController < ApplicationController
  before_action :set_platform

  # GET /resource_links or /resource_links.json
  def index
  end

  def new
    @params = params
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_platform
      @platform = Platform.find(params[:platform_id])
    end
end