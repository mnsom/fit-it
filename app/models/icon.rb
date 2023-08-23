class Icon < ApplicationRecord
  has_many :items
  validates :name, presence: true
  has_one_attached :photo, dependent: :destroy
end
