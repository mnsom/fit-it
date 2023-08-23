class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_many :registered_items
  has_one :icon
  validates :title, :d_length, :d_width, presence: true
  has_one_attached :photo, dependent: :destroy

  CATEGORIES = ["Rectangle table", "Round table", "Chair", "Carpet", "Fridge", "Bed"]
end
