# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/contributions routes' do
  it 'routes to contributions#index' do
    expect(get('/contributions')).to route_to('contributions#index')
  end
end
