require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'scopes' do
    describe '.by_created_date' do
      it 'returns the posts ordered by descending creation date' do
        old_post = create(:post)
        middle_post = create(:post)
        new_post = create(:post)
        ordered_posts = Post.by_created_date

        expect(ordered_posts.first).to eq new_post
        expect(ordered_posts.second).to eq middle_post
        expect(ordered_posts.last).to eq old_post
      end
    end

    describe '.recent' do
      it 'returns the three most recent posts' do
        old_post = create(:post)
        middle_post = create(:post)
        new_post = create(:post)
        recent_posts = Post.recent

        expect(recent_posts.first).to eq new_post
        expect(recent_posts.second).to eq middle_post
        expect(recent_posts.last).to eq old_post
      end
    end
  end
end
