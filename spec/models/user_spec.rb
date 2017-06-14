require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_one(:address).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:cpf) }
    it { should validate_uniqueness_of(:cpf) }
    it { should validate_length_of(:cpf).is_equal_to(11) }
    it { should validate_presence_of(:phone) }
    it { should validate_uniqueness_of(:phone) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:birth_date) }
  end

  describe 'instance methods' do
    describe '#full_name' do
      it 'should return the first and last names in a string' do
        user = create(:user)
        first_name = user.first_name
        last_name = user.last_name

        expect(user.full_name).to eq "#{first_name} #{last_name}"
      end
    end
  end
end
