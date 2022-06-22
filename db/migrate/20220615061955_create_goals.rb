# frozen_string_literal: true

class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.date :deadline

      t.timestamps
    end
  end
end
