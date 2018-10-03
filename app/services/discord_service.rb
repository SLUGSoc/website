# frozen_string_literal: true

# Module for posting events to Discord.
module DiscordService
  class << self
    def event_to_markdown(event)
      template = ERB.new(File.read(Rails.root.join('app', 'views', 'events', '_event.discord.erb')))
      template.result(binding)
    end

    def post_event(event)
      # transmute event into text
      Faraday.post ENV.fetch('DISCORD_WEBHOOK_URL'),
                   content: event_to_markdown(event)
    end
  end
end
