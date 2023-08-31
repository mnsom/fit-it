require "open-uri"

class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_many :registered_items, dependent: :destroy
  belongs_to :icon
  validates :title, :d_length, :d_width, presence: true
  has_one_attached :photo, dependent: :destroy

  CATEGORIES = ["Rectangle table", "Round table", "Chair", "Carpet", "Fridge", "Bed"]

  after_create :add_ikea_photo

  def add_ikea_photo
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML.parse(html_file)
    img_url = html_doc.search(".pip-image").attribute("src").value
    file = URI.open(img_url)
    self.photo.attach(io: file, filename: "#{title}.png", content_type: "image/png")
    self.save
  end
end
