class User < ApplicationRecord
  enum gender: %i[female male not_telling]

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :address, dependent: :destroy

  validates :first_name, presence: true
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
  validates :phone, presence: true, uniqueness: true
  validates :gender, presence: true
  validates :birth_date, presence: true
end
