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
  def show
  end

  # GET /game_event_relations/new
  def new
    @game_event_relation = GameEventRelation.new
  end

  # GET /game_event_relations/1/edit
  def edit
  end

  # POST /game_event_relations
  # POST /game_event_relations.json
  def create
    @game_event_relation = GameEventRelation.new(game_event_relation_params)

    respond_to do |format|
      if @game_event_relation.save
        format.html { redirect_to @game_event_relation, notice: 'Game event relation was successfully created.' }
        format.json { render :show, status: :created, location: @game_event_relation }
      else
        format.html { render :new }
        format.json { render json: @game_event_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_event_relations/1
  # PATCH/PUT /game_event_relations/1.json
  def update
    respond_to do |format|
      if @game_event_relation.update(game_event_relation_params)
        format.html { redirect_to @game_event_relation, notice: 'Game event relation was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_event_relation }
      else
        format.html { render :edit }
        format.json { render json: @game_event_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_event_relations/1
  # DELETE /game_event_relations/1.json
  def destroy
    @game_event_relation.destroy
    respond_to do |format|
      format.html { redirect_to game_event_relations_url, notice: 'Game event relation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_event_relation
      @game_event_relation = GameEventRelation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_event_relation_params
      params.require(:game_event_relation).permit(:game_id, :event_id)
    end
end
