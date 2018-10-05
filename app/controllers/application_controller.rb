# frozen_string_literal: true

class ApplicationController < ActionController::Base
  @lan ||= Event.next_lan
end
