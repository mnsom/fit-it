class Layout < ApplicationRecord
  belongs_to :user
  has_many :registered_items
  validates :title, :scale_ratio, presence: true
end
