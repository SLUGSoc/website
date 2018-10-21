# frozen_string_literal: true

module ApplicationHelper
  def title
    if content_for?(:title)
      # allows the title to be set in the view by using t(".title")
      content_for :title + " - #{t(:site_name)}"
    else
      # look up translation key based on controller path, action name and .title
      # this works identical to the built-in lazy lookup
      t("#{controller_path.tr('/', '.')}.#{action_name}.title",
        default: :site_name)
    end
  end

  def active?(path)
    return 'active' if path == request.path

    ''
  end

  def discord_invite_link
    "https://discord.gg/#{I18n.t :discord_invite_code}"
  end

  def facebook_page_link
    "https://facebook.com/pg/#{I18n.t :facebook_username}"
  end

  def facebook_group_link
    "https://www.facebook.com/groups/#{I18n.t :facebook_group_name}"
  end

  def twitter_page_link
    "https://twitter.com/#{I18n.t :twitter_username}"
  end

  def email_address_link
    "mailto:#{I18n.t :email_address}"
  end

  def society_join_link
    I18n.t :society_join_link
  end
end
