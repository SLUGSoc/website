class Event < ApplicationRecord
  has_many :game_event_relations, dependent: :destroy
  has_many :games, through: :game_event_relations
  def self.all_future
    all.select { |event| event.datetime.future? }
  end

  def facebook_event_link
    "https://facebook.com/#{facebook_event_id}"
  end
end
