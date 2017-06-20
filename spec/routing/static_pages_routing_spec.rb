require 'rails_helper'

RSpec.describe StaticPagesController, type: :routing do
  describe 'routing' do
    it 'routes to #about' do
      expect(get: '/about').to route_to('static_pages#about')
    end

    it 'routes to #booklets' do
      expect(get: '/booklets').to route_to('static_pages#booklets')
    end

    it 'routes to #contact' do
      expect(get: '/contact').to route_to('static_pages#contact')
    end

    it 'routes to #expertise' do
      expect(get: '/expertise').to route_to('static_pages#expertise')
    end

    it 'routes to #home' do
      expect(get: '/home').to route_to('static_pages#home')
    end

    it 'routes to #judgements' do
      expect(get: '/judgements').to route_to('static_pages#judgements')
    end

    it 'routes to #news' do
      expect(get: '/news').to route_to('static_pages#news')
    end

    it 'routes to #videos' do
      expect(get: '/videos').to route_to('static_pages#videos')
    end
  end
end
