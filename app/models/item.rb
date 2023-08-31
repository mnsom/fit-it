require "open-uri"

class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_many :registered_items, dependent: :destroy
  belongs_to :icon
  validates :title, presence: true
  validates :d_length, numericality: { greater_than: 0 }, presence: true
  validates :d_width, numericality: { greater_than: 0 }, presence: true
  has_one_attached :photo, dependent: :destroy

  CATEGORIES = ["Rectangle table", "Round table", "Chair", "Carpet", "Fridge", "Bed"]

  after_create :add_ikea_photo

  def add_ikea_photo
    return if url == "" || url.nil?

    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML.parse(html_file)
    return if html_doc.search(".pip-image").attribute("src").nil?
    img_url = html_doc.search(".pip-image").attribute("src").value

    file = URI.open(img_url)
    self.photo.attach(io: file, filename: "#{title}.png", content_type: "image/png")
    self.save
  end
end
