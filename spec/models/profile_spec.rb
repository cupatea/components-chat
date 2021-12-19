require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { should have_many(:dialogs) }
    it { should have_many(:messages) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
