# frozen_string_literal: true

# Controller for Rule model. Has standard CRUD endpoints for Rules.
# Rules are part of a Code and outline rules society members should abide by.
class RulesController < ApplicationController
  before_action :set_rule, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /rules
  # GET /rules.json
  def index
    @codes = Code.all
  end

  # GET /rules/1
  # GET /rules/1.json
  def show; end

  # GET /rules/new
  def new
    code = Code.find_by(id: params[:code])
    @rule = Rule.new(code: code)
  end

  # GET /rules/1/edit
  def edit; end

  # POST /rules
  # POST /rules.json
  # These controller methods are scaffolded to be like this by default - method
  # length shouldn't be a concern as long as it doesn't grow much.
  # rubocop:disable Metrics/MethodLength
  def create
    @rule = Rule.new(rule_params)

    respond_to do |format|
      if @rule.save
        format.html do
          redirect_to @rule,
                      notice: 'Rule was successfully created.'
        end
        format.json { render :show, status: :created, location: @rule }
      else
        format.html { render :new }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rules/1
  # PATCH/PUT /rules/1.json
  def update
    respond_to do |format|
      if @rule.update(rule_params)
        format.html do
          redirect_to @rule,
                      notice: 'Rule was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @rule }
      else
        format.html { render :edit }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rules/1
  # DELETE /rules/1.json
  def destroy
    @rule.destroy
    respond_to do |format|
      format.html do
        redirect_to rules_url,
                    notice: 'Rule was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rule
    @rule = Rule.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the whitelist
  # through.
  def rule_params
    params.require(:rule).permit(:code_id, :summary, :full, :icon)
  end
end
