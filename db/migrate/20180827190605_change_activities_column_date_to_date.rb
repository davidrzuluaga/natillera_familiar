class ChangeActivitiesColumnDateToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :activities, :date, :string
    change_column :activities, :date, :date
  end
end
