require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:valid_attributes) do
    attributes_for(:post)
  end

  describe 'GET #show' do
    it 'returns http success' do
      post = Post.create! valid_attributes
      get :show, params: { id: post.to_param }
      expect(response).to have_http_status(:success)
    end
  end
end
