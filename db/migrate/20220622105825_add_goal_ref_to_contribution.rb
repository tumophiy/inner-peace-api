# frozen_string_literal: true

class AddGoalRefToContribution < ActiveRecord::Migration[7.0]
  def change
    add_reference :contributions, :goal, null: false, foreign_key: true
  end
end
