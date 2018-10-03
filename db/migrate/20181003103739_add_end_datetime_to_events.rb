class AddEndDatetimeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :end_datetime, :datetime
  end
end
