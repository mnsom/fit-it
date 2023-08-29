require "open-uri"
require "nokogiri"

class IkeaFetchJob < ApplicationJob
  queue_as :default

  def perform(url)
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML.parse(html_file)

    img_url = html_doc.search(".pip-image").attribute("src").value
    item_element = html_doc.search(".pip-temp-price-module__information")
    title = item_element.search(".pip-header-section__title--big").text.strip
    dimensions = item_element.search(".pip-link-button.pip-header-section__description-measurement").text.strip
    width, length = dimensions.split("x")
    width.to_i
    length.to_i
    { title: title, d_width: width, d_length: length, url: img_url }
  end
end
