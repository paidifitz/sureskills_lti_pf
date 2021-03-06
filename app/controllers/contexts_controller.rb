class ContextsController < ApplicationController
  before_action :set_platform
  before_action :set_context, only: %i[ show edit update destroy ]

  # GET /contexts or /contexts.json
  def index
    @contexts = Context.all
  end

  # GET /contexts/1 or /contexts/1.json
  def show
  end

  # GET /contexts/new
  def new
    @context = Context.new
  end

  # GET /contexts/1/edit
  def edit
  end

  # POST /contexts or /contexts.json
  def create
    @context = Context.new(context_params)

    respond_to do |format|
      if @context.save
        format.html { redirect_to platform_context_url(@platform, @context), notice: "Context was successfully created." }
        format.json { render :show, status: :created, location: @context }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @context.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contexts/1 or /contexts/1.json
  def update
    respond_to do |format|
      if @context.update(context_params)
        format.html { redirect_to platform_context_url(@platform, @context), notice: "Context was successfully updated." }
        format.json { render :show, status: :ok, location: @context }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @context.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contexts/1 or /contexts/1.json
  def destroy
    @context.destroy

    respond_to do |format|
      format.html { redirect_to platform_contexts_url(@platform), notice: "Context was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_context
      @context = Context.find(params[:id])
    end

    def set_platform
      @platform = Platform.find(params[:platform_id])
    end

    # Only allow a list of trusted parameters through.
    def context_params
      params.require(:context).permit(:label, :title, :context_type, :platform_id)
    end
end
