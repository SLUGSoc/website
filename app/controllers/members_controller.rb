# frozen_string_literal: true

# Controller for admin pages relating to (committee) members. Renders pages
# related to creating, updating and deleting members.
class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show; end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit; end

  # POST /members
  # POST /members.json
  # These controller methods are scaffolded to be like this by default - method
  # length shouldn't be a concern as long as it doesn't grow much.
  # rubocop:disable Metrics/MethodLength
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html do
          redirect_to @member,
                      notice: 'Member was successfully created.'
        end
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json do
          render json: @member.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html do
          redirect_to @member,
                      notice: 'Member was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json do
          render json: @member.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html do
        redirect_to members_url,
                    notice: 'Member was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the whitelist
  # through.
  def member_params
    params.require(:member).permit(:name, :alias, :role, :blurb, :image_link)
  end
end
