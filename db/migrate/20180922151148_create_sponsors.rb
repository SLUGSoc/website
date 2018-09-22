class CreateSponsors < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :website
      t.string :blurb
      t.string :facebook
      t.string :twitter
      t.string :image_link

      t.timestamps
    end
  end
end
