# frozen_string_literal: true

class Permission < ApplicationRecord
  belongs_to :role
end
