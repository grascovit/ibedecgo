require 'rails_helper'

RSpec.describe Admin::JudgementsHelper, type: :helper do
  describe '#judgement_category_i18n' do
    it 'returns the i18n judgement category' do
      judgement = create(:judgement, category: :consumer)

      expect(helper.judgement_category_i18n(judgement.category)).to eq t('activerecord.attributes.judgement.categories.consumer')
    end
  end

  describe '#judgement_category_options' do
    it 'returns the i18n judgement categories hash' do
      consumer = [t('activerecord.attributes.judgement.categories.consumer'), 'consumer']
      social_security = [t('activerecord.attributes.judgement.categories.social_security'), 'social_security']
      construction = [t('activerecord.attributes.judgement.categories.construction'), 'construction']
      sfh = [t('activerecord.attributes.judgement.categories.sfh'), 'sfh']
      sfi = [t('activerecord.attributes.judgement.categories.sfi'), 'sfi']

      expect(helper.judgement_category_options).to eq [construction, sfh, sfi, social_security, consumer]
    end
  end
end
