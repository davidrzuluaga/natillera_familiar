class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.decimal :earn
      t.string :activity
      t.string :note
      t.date :date

      t.timestamps
    end
  end
end
