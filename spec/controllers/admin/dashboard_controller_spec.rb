require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do
  before(:each) do
    user = create(:user)
    user.confirm

    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_success
    end
  end
end
