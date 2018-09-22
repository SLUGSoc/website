class HomeController < ApplicationController
  def index
  end

  def committee
  end

  def lan
  end

  def socials
    @events ||= Event.all_future
  end

  def sign_up
  end
end
