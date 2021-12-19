require 'rails_helper'

RSpec.describe 'Registration', type: :request do
  describe 'GET #new' do
    before { get new_registration_path }
    it     { expect(response).to have_http_status(:success) }
  end

  describe 'POST #create' do
    before do
      post registration_path,
           params: { user: { name: 'My Name',
                             email: 'my@email.com',
                             password: 'password',
                             password_confirmation: 'password' } }
    end
    it { should redirect_to(root_path) }
  end
end
