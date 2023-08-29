class RegisteredItem < ApplicationRecord
  belongs_to :item
  belongs_to :layout
  before_validation :set_default_values
  validates :x, :y, :rotation, :length, :width, presence: true

  def set_default_values
    self.width = item.d_width if width.nil?
    self.length = item.d_length if length.nil?
    self.x = 0 if x.nil?
    self.y = 0 if y.nil?
    self.rotation = 0 if rotation.nil?
  end

  def icon_url
    "http://res.cloudinary.com/dvdyci2rl/image/upload/v1/#{Rails.env.downcase}/#{item.icon.photo.key}.png"
  end

  def detail_url
    if item.url.present?
      item.url
    else
      "http://res.cloudinary.com/dvdyci2rl/image/upload/v1/#{Rails.env.downcase}/#{item.icon.photo.key}.png"
    end
  end
end
