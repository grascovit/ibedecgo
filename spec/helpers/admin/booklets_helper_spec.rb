require 'rails_helper'

RSpec.describe Admin::BookletsHelper, type: :helper do
  describe '#booklet_category_i18n' do
    it 'returns the i18n judgement category' do
      booklet = create(:booklet, category: :social_security)

      expect(helper.booklet_category_i18n(booklet.category)).to eq t('activerecord.attributes.booklet.categories.social_security')
    end
  end

  describe '#booklet_category_options' do
    it 'returns the i18n judgement categories hash' do
      consumer = [t('activerecord.attributes.booklet.categories.consumer'), 'consumer']
      social_security = [t('activerecord.attributes.booklet.categories.social_security'), 'social_security']
      construction = [t('activerecord.attributes.booklet.categories.construction'), 'construction']
      sfh = [t('activerecord.attributes.booklet.categories.sfh'), 'sfh']
      sfi = [t('activerecord.attributes.booklet.categories.sfi'), 'sfi']

      expect(helper.booklet_category_options).to eq [construction, sfh, sfi, social_security, consumer]
    end
  end
end
