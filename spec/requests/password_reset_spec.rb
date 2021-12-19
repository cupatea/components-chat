require 'rails_helper'

RSpec.describe 'Password Reset', type: :request do
  let!(:user)   { create :user }
  let(:token)   { user.signed_id(purpose: 'password_reset', expires_in: 15.minutes) }

  describe 'GET #new' do
    before { get new_password_reset_path }
    it     { expect(response).to have_http_status(:success) }
  end

  describe 'POST #create' do
    before { post password_reset_path, params: { email: user.email } }
    it     { should redirect_to(root_path) }
  end

  describe 'GET #edit' do
    before { get edit_password_reset_path(token: token) }
    it     { expect(response).to have_http_status(:success) }
  end

  describe 'PUT #update' do
    before do
      put password_reset_path,
          params: { token: token,
                    user: { password: 'new',
                            password_confirmation: 'new' } }
    end
    it { should redirect_to(new_session_path) }
  end
end
