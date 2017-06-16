class Booklet < ApplicationRecord
  enum category: %i[construction sfh sfi social_security consumer]

  belongs_to :user

  validates :title, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :category, presence: true

  has_attached_file :attachment
  validates_attachment :attachment, presence: true, content_type: {
    content_type: %w[
      application/pdf
      application/msword
      application/vnd.openxmlformats-officedocument.wordprocessingml.document
    ]
  }
end
