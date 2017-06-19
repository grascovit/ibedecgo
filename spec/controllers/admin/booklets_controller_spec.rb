require 'rails_helper'

RSpec.describe Admin::BookletsController, type: :controller do
  let(:valid_attributes) do
    attributes_for(:booklet)
  end

  let(:invalid_attributes) do
    attributes_for(:invalid_booklet)
  end

  before(:each) do
    user = create(:user)
    user.confirm

    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      booklet = Booklet.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      booklet = Booklet.create! valid_attributes
      get :show, params: { id: booklet.to_param }
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
      booklet = Booklet.create! valid_attributes
      get :edit, params: { id: booklet.to_param }
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Booklet' do
        expect do
          post :create, params: { booklet: valid_attributes }
        end.to change(Booklet, :count).by(1)
      end

      it 'redirects to the created booklet' do
        post :create, params: { booklet: valid_attributes }
        expect(response).to redirect_to(admin_booklet_url(Booklet.last))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { booklet: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        attributes_for(:booklet)
      end

      it 'updates the requested booklet' do
        booklet = Booklet.create! valid_attributes
        put :update, params: { id: booklet.to_param, booklet: new_attributes }
        booklet.reload
        expect(booklet.title).to eq new_attributes[:title]
        expect(booklet.description).to eq new_attributes[:description]
        expect(booklet.year).to eq new_attributes[:year]
      end

      it 'redirects to the booklet' do
        booklet = Booklet.create! valid_attributes
        put :update, params: { id: booklet.to_param, booklet: valid_attributes }
        expect(response).to redirect_to(admin_booklet_url(booklet))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        booklet = Booklet.create! valid_attributes
        put :update, params: { id: booklet.to_param, booklet: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested booklet' do
      booklet = Booklet.create! valid_attributes
      expect do
        delete :destroy, params: { id: booklet.to_param }
      end.to change(Booklet, :count).by(-1)
    end

    it 'redirects to the booklets list' do
      booklet = Booklet.create! valid_attributes
      delete :destroy, params: { id: booklet.to_param }
      expect(response).to redirect_to(admin_booklets_url)
    end
  end
end
