# frozen_string_literal: true

class RemoveRoleIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role_id
  end
end
