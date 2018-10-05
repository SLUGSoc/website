# frozen_string_literal: true

# Controller for Platform model. Has standard CRUD endpoints for Platforms.
# Platforms represent game platforms such as Steam and consoles.
class PlatformsController < ApplicationController
  before_action :set_platform, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /platforms
  # GET /platforms.json
  def index
    @platforms = Platform.all
  end

  # GET /platforms/1
  # GET /platforms/1.json
  def show; end

  # GET /platforms/new
  def new
    @platform = Platform.new
  end

  # GET /platforms/1/edit
  def edit; end

  # POST /platforms
  # POST /platforms.json
  # These controller methods are scaffolded to be like this by default - method
  # length shouldn't be a concern as long as it doesn't grow much.
  # rubocop:disable Metrics/MethodLength
  def create
    @platform = Platform.new(platform_params)

    respond_to do |format|
      if @platform.save
        format.html do
          redirect_to @platform,
                      notice: 'Platform was successfully created.'
        end
        format.json { render :show, status: :created, location: @platform }
      else
        format.html { render :new }
        format.json do
          render json: @platform.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /platforms/1
  # PATCH/PUT /platforms/1.json
  def update
    respond_to do |format|
      if @platform.update(platform_params)
        format.html do
          redirect_to @platform,
                      notice: 'Platform was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @platform }
      else
        format.html { render :edit }
        format.json do
          render json: @platform.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /platforms/1
  # DELETE /platforms/1.json
  def destroy
    @platform.destroy
    respond_to do |format|
      format.html do
        redirect_to platforms_url,
                    notice: 'Platform was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_platform
    @platform = Platform.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def platform_params
    params.require(:platform).permit(:name, :icon)
  end
end
