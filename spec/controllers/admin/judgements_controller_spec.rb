require 'rails_helper'

RSpec.describe Admin::JudgementsController, type: :controller do
  let(:valid_attributes) do
    attributes_for(:judgement)
  end

  let(:invalid_attributes) do
    attributes_for(:invalid_judgement)
  end

  before(:each) do
    user = create(:user)
    user.confirm

    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      judgement = Judgement.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      judgement = Judgement.create! valid_attributes
      get :show, params: { id: judgement.to_param }
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
      judgement = Judgement.create! valid_attributes
      get :edit, params: { id: judgement.to_param }
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Judgement' do
        expect do
          post :create, params: { judgement: valid_attributes }
        end.to change(Judgement, :count).by(1)
      end

      it 'redirects to the created judgement' do
        post :create, params: { judgement: valid_attributes }
        expect(response).to redirect_to(admin_judgement_url(Judgement.last))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { judgement: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        attributes_for(:judgement)
      end

      it 'updates the requested judgement' do
        judgement = Judgement.create! valid_attributes
        put :update, params: { id: judgement.to_param, judgement: new_attributes }
        judgement.reload
        expect(judgement.title).to eq new_attributes[:title]
        expect(judgement.released_at).to eq new_attributes[:released_at]
        expect(judgement.category).to eq new_attributes[:category]
      end

      it 'redirects to the judgement' do
        judgement = Judgement.create! valid_attributes
        put :update, params: { id: judgement.to_param, judgement: valid_attributes }
        expect(response).to redirect_to(admin_judgement_url(judgement))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        judgement = Judgement.create! valid_attributes
        put :update, params: { id: judgement.to_param, judgement: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested judgement' do
      judgement = Judgement.create! valid_attributes
      expect do
        delete :destroy, params: { id: judgement.to_param }
      end.to change(Judgement, :count).by(-1)
    end

    it 'redirects to the judgements list' do
      judgement = Judgement.create! valid_attributes
      delete :destroy, params: { id: judgement.to_param }
      expect(response).to redirect_to(admin_judgements_url)
    end
  end
end
