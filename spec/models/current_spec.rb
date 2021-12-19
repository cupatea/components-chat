require 'rails_helper'

RSpec.describe Current, type: :model do
  describe 'user' do
    let(:user) { create :user }

    it 'responds with nil when no user assigned' do
      expect(described_class.user).to be_nil
    end

    it 'saves and responds with user' do
      described_class.user = user
      expect(described_class.user).to eq(user)
    end
  end
end
