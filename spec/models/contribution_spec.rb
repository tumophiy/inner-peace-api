require 'rails_helper'

RSpec.describe Contribution, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:description) }
  end
  describe 'one associated' do
    it { should have_one(:goal) }
  end
end
