require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #about' do
    it 'returns http success' do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #booklets' do
    it 'returns http success' do
      get :booklets
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #contact' do
    it 'returns http success' do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #expertise' do
    it 'returns http success' do
      get :expertise
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #home' do
    it 'returns http success' do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #judgements' do
    it 'returns http success' do
      get :judgements
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #news' do
    it 'returns http success' do
      get :news
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #videos' do
    it 'returns http success' do
      get :videos
      expect(response).to have_http_status(:success)
    end
  end
end
