# frozen_string_literal: true

class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.references :game,  foreign_key: { on_delete: :cascade }
      t.references :platform, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
