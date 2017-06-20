require 'rails_helper'

RSpec.describe Booklet, type: :model do
  describe 'associations' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:category) }
    it { should validate_attachment_presence(:attachment) }
  end

  describe 'scopes' do
    describe '.by_created_date' do
      it 'returns the booklets ordered by descending creation date' do
        old_booklet = create(:booklet)
        middle_booklet = create(:booklet)
        new_booklet = create(:booklet)
        ordered_booklets = Booklet.by_created_date

        expect(ordered_booklets.first).to eq new_booklet
        expect(ordered_booklets.second).to eq middle_booklet
        expect(ordered_booklets.last).to eq old_booklet
      end
    end
  end
end
