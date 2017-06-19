require 'rails_helper'

RSpec.describe Admin::JudgementsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/judgements').to route_to('admin/judgements#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/judgements/new').to route_to('admin/judgements#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/judgements/1').to route_to('admin/judgements#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/judgements/1/edit').to route_to('admin/judgements#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/judgements').to route_to('admin/judgements#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/judgements/1').to route_to('admin/judgements#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/judgements/1').to route_to('admin/judgements#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/judgements/1').to route_to('admin/judgements#destroy', id: '1')
    end
  end
end
