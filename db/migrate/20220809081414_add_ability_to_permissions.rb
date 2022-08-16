# frozen_string_literal: true

class AddAbilityToPermissions < ActiveRecord::Migration[7.0]
  def change
    add_column :permissions, :ability, :boolean
  end
end
