class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :alias
      t.string :role
      t.string :blurb
      t.string :image_link

      t.timestamps
    end
  end
end
