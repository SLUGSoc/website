module FacebookService
  class << self
    def event_to_facebook_post(event)
      template = ERB.new(File.read(Rails.root.join('app', 'views', 'events', '_event.facebook.erb')))
      template.result(binding)
    end

    def post_event(event)
      client.put_connections('me', 'feed', message: event_to_facebook_post(event), link: event.facebook_event_link)
    end

    def client
      @user_graph ||= Koala::Facebook::API.new(ENV.fetch('FACEBOOK_USER_ACCESS_TOKEN'))
      page_token = @user_graph.get_page_access_token(ENV.fetch('FACEBOOK_PAGE_ID'))
      @page_graph ||= Koala::Facebook::API.new(page_token)
    end
  end
end
