class ApplicationController < ActionController::Base
  before_action :set_social_links


  def discord_invite_link
    "https://discord.gg/#{@discord_invite_code}"
  end

  def facebook_page_link
    "https://facebook.com/pg/#{@facebook_username}"
  end

  def facebook_group_link
    "https://www.facebook.com/groups/#{@facebook_group_name}"
  end

  def twitter_page_link
    "https://twitter.com/#{@twitter_username}"
  end

  def set_social_links
    @discord_invite_code = "0qD2mZ0yB1K8HfOA"
    @facebook_username = "SLUGSoc"
    @facebook_group_name = "slugsoc"
    @twitter_username = "SLUGSoc"
    @society_join_link = "https://su.sheffield.ac.uk/groups/computer-gaming-society/join"
    @discord_invite_link ||= discord_invite_link
    @facebook_page_link ||= facebook_page_link
    @twitter_page_link ||= twitter_page_link
    @facebook_group_link ||= facebook_group_link
  end
end
