require 'rails_helper'

RSpec.describe Permission, type: :model do
  describe 'associations' do
    it { should have_many(:roles) }
    it { should have_many(:role_permissions) }
  end
end
