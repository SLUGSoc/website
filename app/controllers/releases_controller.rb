# frozen_string_literal: true

# Allows an admin to map games to platforms to create Releases.
class ReleasesController < ApplicationController
  before_action :set_release, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /releases
  # GET /releases.json
  def index
    @releases = Release.all
  end

  # GET /releases/1
  # GET /releases/1.json
  def show; end

  # GET /releases/new
  def new
    @release = Release.new
  end

  # GET /releases/1/edit
  def edit; end

  # POST /releases
  # POST /releases.json
  # These controller methods are scaffolded to be like this by default - method
  # length shouldn't be a concern as long as it doesn't grow much.
  # rubocop:disable Metrics/MethodLength
  def create
    @release = Release.new(release_params)

    respond_to do |format|
      if @release.save
        format.html do
          redirect_to @release,
                      notice: 'Release was successfully created.'
        end
        format.json { render :show, status: :created, location: @release }
      else
        format.html { render :new }
        format.json do
          render json: @release.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /releases/1
  # PATCH/PUT /releases/1.json
  def update
    respond_to do |format|
      if @release.update(release_params)
        format.html do
          redirect_to @release,
                      notice: 'Release was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @release }
      else
        format.html { render :edit }
        format.json do
          render json: @release.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /releases/1
  # DELETE /releases/1.json
  def destroy
    @release.destroy
    respond_to do |format|
      format.html do
        redirect_to releases_url,
                    notice: 'Release was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_release
    @release = Release.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the whitelist
  # through.
  def release_params
    params.require(:release).permit(:game_id, :platform_id)
  end
end
