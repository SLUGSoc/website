class CreateGameEventRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :game_event_relations do |t|
      t.references :game, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
