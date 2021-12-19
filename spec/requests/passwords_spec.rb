require 'rails_helper'

RSpec.describe 'Password', type: :request do
  let!(:user) { create :user }
  before do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
  end

  describe 'GET #edit' do
    before { get edit_password_path }
    it     { expect(response).to have_http_status(:success) }
  end

  describe 'PUT #update' do
    before do
      put password_path,
          params: { user: { password: 'new',
                            password_confirmation: 'new' } }
    end
    it { should redirect_to(root_path) }
  end
end
