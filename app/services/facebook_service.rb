# frozen_string_literal: true

module FacebookService
  class << self
    def event_to_facebook_post(event)
      template = ERB.new(File.read(Rails.root.join('app', 'views', 'events', '_event.facebook.erb')))
      template.result(binding)
    end

    def post_event(event)
      client.put_picture(event.image_link, { message: event_to_facebook_post(event) }, ENV.fetch('FACEBOOK_PAGE_ID')) # post as picture with caption
    end

    def client
      @user_graph ||= Koala::Facebook::API.new(ENV.fetch('FACEBOOK_USER_ACCESS_TOKEN'))
      page_token = @user_graph.get_page_access_token(ENV.fetch('FACEBOOK_PAGE_ID'))
      @page_graph ||= Koala::Facebook::API.new(page_token)
    end

    def get_event(facebook_event_id)
      client.get_object(facebook_event_id, fields: %w[cover name description place start_time])
    end
  end
end
