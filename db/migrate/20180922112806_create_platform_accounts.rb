class CreatePlatformAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :platform_accounts do |t|
      t.references :platform, foreign_key: true
      t.references :member, foreign_key: true
      t.string :tag
      t.string :internal_link

      t.timestamps
    end
  end
end
