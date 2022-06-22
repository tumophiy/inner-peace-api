# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Goal, type: :model do
  it 'tests a number to be positive' do
    expect(1).to be_positive
  end
end
