class AddActivitylistToActivity < ActiveRecord::Migration[5.2]
  def change
    add_reference :activities, :activitylist, foreign_key: true
  end
end
