require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'reset_password_email' do
    let(:user) { create :user }
    let(:mail) { described_class.with(user: user).reset_password_email }

    it 'renders the headers' do
      expect(mail.subject).to eq('Reset password email')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end

  describe 'welcome_email' do
    let(:user) { create :user }
    let(:mail) { described_class.with(user: user).welcome_email }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Welcome')
    end
  end
end
