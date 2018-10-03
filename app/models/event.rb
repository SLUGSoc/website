# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :game_event_relations, dependent: :destroy
  has_many :games, through: :game_event_relations
  validates :datetime, presence: true
  validates :location, presence: true
  validates :lan_number, numericality: { only_integer: true }, allow_nil: true
  validates :name, presence: true
  validates :description, presence: true
  validate :end_after_start
  default_scope { order('datetime ASC, id ASC') }

  def self.all_future
    all.select { |event| event.datetime.future? }
  end

  def facebook_event_link
    "https://facebook.com/events/#{facebook_event_id}"
  end

  def dates
    dates = I18n.l(datetime, format: :day)
    dates += " - #{I18n.l(end_datetime, format: :day)}" unless
      multiple_day_event? || end_datetime.blank?
    dates
  end

  def multiple_day_event?
    datetime.to_date == end_datetime&.to_date
  end

  def times
    times = I18n.l(datetime, format: :short_12_hour_time)
    times += " - #{I18n.l(end_datetime, format: :short_12_hour_time)}" unless end_datetime.blank?
    times
  end

  def datetimes(_time_format = :long_ordinal)
    datetimes = I18n.l(datetime, format: :long)
    datetimes += " - #{I18n.l(end_datetime, format: :long)}" unless end_datetime.blank?
    datetimes
  end

  def self.next_lan
    all_future.find { |event| !!(event.name =~ /LAN \d{2,3}/) }
  end

  def self.new_from_facebook_event(facebook_event)
    Event.new(
      name: facebook_event['name'],
      description: facebook_event['description'],
      location: facebook_event.dig('place', 'name'),
      datetime: DateTime.parse(facebook_event['start_time']),
      image_link: facebook_event.dig('cover', 'source'),
      facebook_event_id: facebook_event['id'],
      ticket_link: facebook_event['ticket_uri']
    )
  end

  def end_after_start
    false unless end_datetime
    valid = datetime && end_datetime && end_datetime > datetime
    errors[:datetime] << 'must be before end time' unless valid
  end
end
