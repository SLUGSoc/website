# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @sponsors ||= Sponsor.all
    @events ||= Event.all_future.take(3)
    @servers ||= Server.all
  end

  def committee; end

  def lan
    @rules ||= Code.find_by(name: 'LAN Rules')
  end

  def events
    @events ||= Event.all_future
  end

  def sign_up; end

  def contact_us; end
end
