class AddInterestRateToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :interest_rate, :integer
  end
end
