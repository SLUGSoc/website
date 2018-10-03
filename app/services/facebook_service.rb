# frozen_string_literal: true

# Service for posting to, and retrieving events from, Facebook
module FacebookService
  class << self
    def event_to_facebook_post(event)
      template = ERB.new(File.read(
                           Rails.root.join('app', 'views', 'events',
                                           '_event.facebook.erb')
                         ))
      template.result(binding)
    end

    # post as picture with caption
    def post_event(event)
      client.put_picture(event.image_link,
                         { message: event_to_facebook_post(event) },
                         ENV.fetch('FACEBOOK_PAGE_ID'))
    end

    def client
      @user_graph ||= Koala::Facebook::API.new(
        ENV.fetch('FACEBOOK_USER_ACCESS_TOKEN')
      )
      page_token = @user_graph.get_page_access_token(
        ENV.fetch('FACEBOOK_PAGE_ID')
      )
      @client ||= Koala::Facebook::API.new(page_token)
    end

    def get_event(facebook_event_id)
      client.get_object(facebook_event_id,
                        fields: %w[cover name description place start_time])
    end
  end
end
