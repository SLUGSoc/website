class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.references :game, foreign_key: true
      t.integer :port

      t.timestamps
    end
  end
end
