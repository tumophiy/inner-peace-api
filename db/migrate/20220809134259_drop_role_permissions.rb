# frozen_string_literal: true

class DropRolePermissions < ActiveRecord::Migration[7.0]
  def change
    drop_table :role_permissions
  end
end
