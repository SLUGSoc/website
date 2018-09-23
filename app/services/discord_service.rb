module DiscordService
  class << self
    def event_to_markdown(event)
      template = ERB.new(File.read(Rails.root.join('app', 'views', 'events', '_event.discord.erb')))
      template.result(binding)
    end

    def post_event(event)
      # transmute event into text
      Faraday.post 'https://discordapp.com/api/webhooks/487712917089681420/Xla57omuu4BRkVp0L72bBWvIozlccDH8v3M1tm43LRgY4EIJb-fKZWMyjg_8B_lI_ORv',
                   {content: event_to_markdown(event)}
    end
  end
end
