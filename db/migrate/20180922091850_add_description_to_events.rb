# frozen_string_literal: true

class AddDescriptionToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :description, :string
  end
end
