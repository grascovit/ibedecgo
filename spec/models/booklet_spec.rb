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
end
