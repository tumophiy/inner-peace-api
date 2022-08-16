# frozen_string_literal: true

class RemoveDescriptionFromPermissions < ActiveRecord::Migration[7.0]
  def change
    remove_column :permissions, :description
  end
end
