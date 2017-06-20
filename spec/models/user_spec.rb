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

  describe 'scopes' do
    describe '.by_created_date' do
      it 'returns the users ordered by descending creation date' do
        old_user = create(:user)
        middle_user = create(:user)
        new_user = create(:user)
        ordered_users = User.by_created_date

        expect(ordered_users.first).to eq new_user
        expect(ordered_users.second).to eq middle_user
        expect(ordered_users.last).to eq old_user
      end
    end
  end
end
