class AddAmountToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :amount, :integer
  end
end
