class CreateGameEventRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :game_event_relations do |t|
      t.references :game,  foreign_key: {on_delete: :cascade}
      t.references :event,  foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
