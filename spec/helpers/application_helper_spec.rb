require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#active_menu_item_class' do
    context 'when the current page is the selected menu' do
      it 'returns the active string' do
        helper.request.path = admin_posts_path

        expect(helper.active_menu_item_class(admin_posts_path)).to eq 'active'
      end
    end

    context 'when the current page is not the selected menu' do
      it 'returns an empty string' do
        helper.request.path = admin_posts_path

        expect(helper.active_menu_item_class(admin_users_path)).to eq ''
      end
    end
  end

  describe '#format_timestamp' do
    it 'returns the formatted time string' do
      post = create(:post, created_at: '13-06-2017 00:00')

      expect(helper.format_timestamp(post.created_at)).to eq('13/06/2017 00:00')
    end
  end
end
