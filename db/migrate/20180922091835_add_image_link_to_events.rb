# frozen_string_literal: true

class AddImageLinkToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :image_link, :string
  end
end
