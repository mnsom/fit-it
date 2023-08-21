class RegisteredItem < ApplicationRecord
  belongs_to :item
  belongs_to :layout
  validates :x, :y, :rotation, :length, :width, presence: true
end
