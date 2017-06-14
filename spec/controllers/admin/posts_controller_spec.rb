require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  let(:valid_attributes) do
    attributes_for(:post)
  end

  let(:invalid_attributes) do
    attributes_for(:invalid_post)
  end

  before(:each) do
    user = create(:user)
    user.confirm

    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      post = Post.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      post = Post.create! valid_attributes
      get :show, params: { id: post.to_param }
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      post = Post.create! valid_attributes
      get :edit, params: { id: post.to_param }
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Post' do
        expect do
          post :create, params: { post: valid_attributes }
        end.to change(Post, :count).by(1)
      end

      it 'redirects to the created post' do
        post :create, params: { post: valid_attributes }
        expect(response).to redirect_to(admin_post_url(Post.last))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { post: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        attributes_for(:post)
      end

      it 'updates the requested post' do
        post = Post.create! valid_attributes
        put :update, params: { id: post.to_param, post: new_attributes }
        post.reload
        expect(post.title).to eq(new_attributes[:title])
        expect(post.body).to eq(new_attributes[:body])
      end

      it 'redirects to the post' do
        post = Post.create! valid_attributes
        put :update, params: { id: post.to_param, post: valid_attributes }
        expect(response).to redirect_to(admin_post_url(post))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        post = Post.create! valid_attributes
        put :update, params: { id: post.to_param, post: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested post' do
      post = Post.create! valid_attributes
      expect do
        delete :destroy, params: { id: post.to_param }
      end.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      post = Post.create! valid_attributes
      delete :destroy, params: { id: post.to_param }
      expect(response).to redirect_to(admin_posts_url)
    end
  end
end
