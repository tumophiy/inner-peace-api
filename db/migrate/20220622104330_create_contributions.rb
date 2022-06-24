class CreateContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :contributions do |t|
      t.integer :amount, null: false
      t.string :description, null: false
      t.date :expected_date

      t.timestamps
    end
  end
end
