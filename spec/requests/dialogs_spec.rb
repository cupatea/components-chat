require 'rails_helper'

RSpec.describe 'Dialogs', type: :request do
  let!(:user)   { create :user }
  let!(:dialog) { create :dialog, user: user }

  before do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    before { get dialogs_path }
    it     { expect(response).to have_http_status(:success) }
  end

  describe 'GET #show' do
    before { get dialog_path(dialog) }
    it     { expect(response).to have_http_status(:success) }
  end

  describe 'GET #new' do
    before { get new_dialog_path }
    it     { expect(response).to have_http_status(:success) }
  end

  describe 'POST #create' do
    let(:profile)        { create :profile }
    let(:created_dialog) { Dialog.find_by(user: user, profile: profile) }
    before        { post dialogs_path, params: { dialog: { profile_id: profile.id } } }
    it            { should redirect_to(dialog_path(created_dialog.id)) }
  end
end
