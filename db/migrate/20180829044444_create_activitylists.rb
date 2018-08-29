class CreateActivitylists < ActiveRecord::Migration[5.2]
  def change
    create_table :activitylists do |t|
      t.string :name
      t.string :person
      t.date :date

      t.timestamps
    end
  end
end
