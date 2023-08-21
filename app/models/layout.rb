class Layout < ApplicationRecord
  belongs_to :user
  has_many :registered_items
  validates :title, :scale_ratio, presence: true
  has_one_attached :photo, dependent: :destroy
end
