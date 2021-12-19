require 'rails_helper'

RSpec.describe Dialog, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:profile) }
    it { should have_many(:messages) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:profile_id).scoped_to(:user_id) }
  end
end
