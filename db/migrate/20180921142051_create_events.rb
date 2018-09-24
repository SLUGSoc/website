# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :datetime
      t.string :location
      t.integer :lan_number
      t.string :facebook_event_id
      t.string :ticket_link

      t.timestamps
    end
  end
end
