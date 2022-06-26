# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/goals routes' do
  it 'routes to goals#show' do
    expect(get('/goals/1')).to route_to('goals#show', id: '1')
  end
end
