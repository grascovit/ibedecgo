require 'rails_helper'

RSpec.describe Judgement, type: :model do
  describe 'associations' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:category) }
    it { should validate_attachment_presence(:attachment) }
  end

  describe 'scopes' do
    describe '.by_created_date' do
      it 'returns the judgements ordered by descending creation date' do
        old_judgement = create(:judgement)
        middle_judgement = create(:judgement)
        new_judgement = create(:judgement)
        ordered_judgements = Judgement.by_created_date

        expect(ordered_judgements.first).to eq new_judgement
        expect(ordered_judgements.second).to eq middle_judgement
        expect(ordered_judgements.last).to eq old_judgement
      end
    end
  end
end
