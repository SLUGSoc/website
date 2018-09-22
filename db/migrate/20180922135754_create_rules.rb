class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.references :code, foreign_key: true
      t.string :summary
      t.string :full
      t.string :icon

      t.timestamps
    end
  end
end
