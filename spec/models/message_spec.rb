require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'associations' do
    it { should belong_to(:author) }
    it { should belong_to(:dialog) }
  end
end
