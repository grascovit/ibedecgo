require 'rails_helper'

RSpec.describe BookletsController, type: :controller do
  let(:valid_attributes) do
    attributes_for(:booklet)
  end

  describe 'GET #show' do
    it 'returns http success' do
      booklet = Booklet.create! valid_attributes
      get :show, params: { id: booklet.to_param }
      expect(response).to have_http_status(:success)
    end
  end
end
