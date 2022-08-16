# frozen_string_literal: true

class AddStatusToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :status, :integer, default: 0
  end
end
