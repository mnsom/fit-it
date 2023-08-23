class Icon < ApplicationRecord
  belongs_to :items
  validates :name, presence: true
  has_one_attached :photo, dependent: :destroy
end
