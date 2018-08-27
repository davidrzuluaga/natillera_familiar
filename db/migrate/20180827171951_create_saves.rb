class CreateSaves < ActiveRecord::Migration[5.2]
  def change
    create_table :saves do |t|
      t.references :user, foreign_key: true
      t.decimal :money
      t.date :month
      t.string :note

      t.timestamps
    end
  end
end
