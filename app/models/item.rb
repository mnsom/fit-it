class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_many :registered_items
  validates :title, :d_length, :d_width, presence: true
end
