require 'rails_helper'

RSpec.describe 'Welcomes', type: :request do
  describe 'GET #index' do
    before { get root_path }
    it     { expect(response).to have_http_status(:success) }
  end
end
