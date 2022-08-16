# frozen_string_literal: true

class ChangePermissions < ActiveRecord::Migration[7.0]
  def change
    remove_column :permissions, :name, :string
    remove_column :permissions, :ability, :boolean
    add_column :permissions, :can_see_goal, :boolean
    add_column :permissions, :can_index_goals, :boolean
    add_column :permissions, :can_update_goal, :boolean
    add_column :permissions, :can_delete_goal, :boolean
    add_column :permissions, :can_create_goal, :boolean
    add_column :permissions, :can_see_contribution, :boolean
    add_column :permissions, :can_index_contributions, :boolean
    add_column :permissions, :can_delete_contribution, :boolean
    add_column :permissions, :can_create_contribution, :boolean
    add_reference :permissions, :role
  end
end
