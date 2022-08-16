# frozen_string_literal: true

class CreateRolePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :role_permissions do |t|
      t.bigint :role_id
      t.bigint :permission_id

      t.timestamps
    end
  end
end
