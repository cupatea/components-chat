require 'rails_helper'

RSpec.describe 'Session', type: :request do
  let(:password)  { 'my password' }
  let!(:user)     { create :user, password: 'password' }

  describe 'GET #new' do
    before { get new_session_path }
    it     { expect(response).to have_http_status(:success) }
  end

  describe 'POST #create' do
    before { post session_path, params: { email: user.email, password: user.password } }
    it     { should redirect_to(root_path) }
  end

  describe 'DELETE #destroy' do
    before { delete session_path }
    it     { should redirect_to(root_path) }
  end
end
