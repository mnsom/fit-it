class Layout < ApplicationRecord
  belongs_to :user
  has_many :registered_items
  validates :title, presence: true
  has_one_attached :photo, dependent: :destroy
end
