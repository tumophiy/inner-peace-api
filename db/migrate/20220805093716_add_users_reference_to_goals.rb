# frozen_string_literal: true

class AddUsersReferenceToGoals < ActiveRecord::Migration[7.0]
  def change
    add_reference :goals, :user
  end
end
