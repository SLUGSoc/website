class HomeController < ApplicationController
  def index
  end

  def committee
  end

  def lan
    @rules ||= Code.find_by(name: 'LAN Rules')
  end

  def socials
    @events ||= Event.all_future
  end

  def sign_up
  end
end
