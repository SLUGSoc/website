# frozen_string_literal: true

module ApplicationHelper
  def title
    if content_for?(:title)
      # allows the title to be set in the view by using t(".title")
      content_for :title + " - #{t(:site_name)}"
    else
      # look up translation key based on controller path, action name and .title
      # this works identical to the built-in lazy lookup
      t("#{controller_path.tr('/', '.')}.#{action_name}.title", default: :site_name)
    end
  end

  def active?(path)
    return 'active' if path == request.path

    ''
  end
end
