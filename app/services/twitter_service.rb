# frozen_string_literal: true

# Module for posting to Twitter.
module TwitterService
  class << self
    def event_to_tweet(event)
      template = ERB.new(File.read(
                           Rails.root.join('app', 'views', 'events',
                                           '_event.twitter.erb')
                         ))
      template.result(binding)
    end

    def post_event(event)
      client.update(event_to_tweet(event))
    end

    def client
      @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV.fetch('TWITTER_CONSUMER_KEY')
        config.consumer_secret     = ENV.fetch('TWITTER_CONSUMER_SECRET')
        config.access_token        = ENV.fetch('TWITTER_ACCESS_TOKEN')
        config.access_token_secret = ENV.fetch('TWITTER_ACCESS_TOKEN_SECRET')
      end
    end
  end
end
