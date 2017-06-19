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

  describe '#flash_message_class' do
    context 'when the flash is a notice' do
      it 'returns the positive string' do
        expect(helper.flash_message_class('notice')).to eq('positive')
      end
    end

    context 'when the flash is an alert' do
      it 'returns the negative string' do
        expect(helper.flash_message_class('alert')).to eq('negative')
      end
    end
  end

  describe '#attachment_icon_class' do
    context 'when the attachment is a PDF' do
      it 'returns the pdf icon class' do
        expect(helper.attachment_icon_class(ApplicationHelper::PDF_MIME_TYPE)).to eq 'massive red file pdf outline document icon'
      end
    end

    context 'when the attachment is a DOC' do
      it 'returns the word icon class' do
        expect(helper.attachment_icon_class(ApplicationHelper::DOC_MIME_TYPE)).to eq 'massive blue file word outline document icon'
      end
    end

    context 'when the attachment is a DOCX' do
      it 'returns the word icon class' do
        expect(helper.attachment_icon_class(ApplicationHelper::DOCX_MIME_TYPE)).to eq 'massive blue file word outline document icon'
      end
    end
  end
end
