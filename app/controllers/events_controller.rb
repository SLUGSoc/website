# frozen_string_literal: true

# Pages for admins to create, edit, update and delete events. Also takes care of
# posting to Facebook, Twitter and Discord once an event is created..
class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: 'show'

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show; end

  # GET /events/new
  def new
    @event = Event.new
    unless params[:facebook_event_id].blank?
      facebook_event = FacebookService.get_event(params[:facebook_event_id])
    end
    @event = Event.new_from_facebook_event(facebook_event) if facebook_event
  rescue Koala::Facebook::ClientError => e
    flash[:alert] = "Facebook event could not be retrieved - #{e.message}"
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  # These controller methods are scaffolded to be like this by default - method
  # length shouldn't be a concern as long as it doesn't grow much.
  # rubocop:disable Metrics/MethodLength
  # I'll admit AbcSize is a monster right now, though.
  # rubocop:disable Metrics/AbcSize
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        begin
          if params['event']['facebook'].to_i.positive?
            FacebookService.post_event(@event)
          end
        rescue Koala::Facebook::ClientError => e
          flash[:alert] = "Facebook: #{e.inspect}"
        end
        if params['event']['twitter'].to_i.positive?
          TwitterService.post_event(@event)
        end
        if params['event']['discord'].to_i.positive?
          DiscordService.post_event(@event)
        end
        format.html do
          redirect_to @event,
                      notice: 'Event was successfully created.'
        end
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json do
          render json: @event.errors, status: :unprocessable_entity
        end
      end
    end
  end
  # rubocop:enable Metrics/AbcSize

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html do
          redirect_to @event,
                      notice: 'Event was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json do
          render json: @event.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html do
        redirect_to events_url,
                    notice: 'Event was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the whitelist
  # through.
  def event_params
    params.require(:event)
          .permit(:name, :description, :image_link, :datetime, :end_datetime,
                  :location, :lan_number, :facebook_event_id, :ticket_link)
  end
end
