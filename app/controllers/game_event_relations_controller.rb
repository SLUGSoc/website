# frozen_string_literal: true

# Allows admin users to manage the times at which a game has appeared at an
# event.
class GameEventRelationsController < ApplicationController
  before_action :set_game_event_relation, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /game_event_relations
  # GET /game_event_relations.json
  def index
    @game_event_relations = GameEventRelation.all
  end

  # GET /game_event_relations/1
  # GET /game_event_relations/1.json
  def show; end

  # GET /game_event_relations/new
  def new
    @game_event_relation = GameEventRelation.new
  end

  # GET /game_event_relations/1/edit
  def edit; end

  # POST /game_event_relations
  # POST /game_event_relations.json
  # These controller methods are scaffolded to be like this by default - method
  # length shouldn't be a concern as long as it doesn't grow much.
  # rubocop:disable Metrics/MethodLength
  def create
    @game_event_relation = GameEventRelation.new(game_event_relation_params)

    respond_to do |format|
      if @game_event_relation.save
        format.html do
          redirect_to @game_event_relation,
                      notice: 'Game event relation was successfully created.'
        end
        format.json do
          render :show, status: :created,
                        location: @game_event_relation
        end
      else
        format.html { render :new }
        format.json do
          render json: @game_event_relation.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /game_event_relations/1
  # PATCH/PUT /game_event_relations/1.json
  def update
    respond_to do |format|
      if @game_event_relation.update(game_event_relation_params)
        format.html do
          redirect_to @game_event_relation,
                      notice: 'Game event relation was successfully updated.'
        end
        format.json do
          render :show, status: :ok,
                        location: @game_event_relation
        end
      else
        format.html { render :edit }
        format.json do
          render json: @game_event_relation.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /game_event_relations/1
  # DELETE /game_event_relations/1.json
  def destroy
    @game_event_relation.destroy
    respond_to do |format|
      format.html do
        redirect_to game_event_relations_url,
                    notice: 'Game event relation was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game_event_relation
    @game_event_relation = GameEventRelation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the whitelist
  # through.
  def game_event_relation_params
    params.require(:game_event_relation).permit(:game_id, :event_id)
  end
end
