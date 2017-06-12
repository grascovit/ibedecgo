class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  has_attached_file :image,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/assets/:style/missing-image.png'
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}
end
