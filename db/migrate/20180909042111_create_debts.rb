class CreateDebts < ActiveRecord::Migration[5.2]
  def change
    create_table :debts do |t|
      t.references :user, foreign_key: true
      t.decimal :money
      t.date :date
      t.string :note

      t.timestamps
    end
  end
end
