# frozen_string_literal: true

# Controller for the front-facing pages of the site. Supplies the right data to
# publicly-facing pages and renders them.
class HomeController < ApplicationController
  def index
    events
    sponsors
    upcoming_events
    servers
  end

  def committee; end

  def lan
    rules
  end

  def events
    @events ||= Event.all_future
  end

  def sign_up; end

  def contact_us; end

  private

  def rules
    @rules ||= Code.find_by(name: 'LAN Rules')
  end

  def sponsors
    @sponsors ||= Sponsor.all
  end

  def upcoming_events
    @upcoming_events ||= Event.all_future.take(3)
  end

  def servers
    @servers ||= Server.all
  end
end
