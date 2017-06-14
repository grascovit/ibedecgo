require 'rails_helper'

RSpec.describe Admin::UsersHelper, type: :helper do
  describe '#gender_i18n' do
    it 'returns the i18n user gender' do
      male = create(:user, gender: :male)

      expect(helper.gender_i18n(male.gender)).to eq t('activerecord.attributes.user.genders.male')
    end
  end

  describe '#gender_options' do
    it 'returns the i18n user genders hash' do
      female = [t('activerecord.attributes.user.genders.female'), 'female']
      male = [t('activerecord.attributes.user.genders.male'), 'male']
      not_telling = [t('activerecord.attributes.user.genders.not_telling'), 'not_telling']

      expect(helper.gender_options).to eq [female, male, not_telling]
    end
  end
end
