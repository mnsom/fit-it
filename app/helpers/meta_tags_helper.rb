module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["Fit It - Clean layout Clear mind"]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["Visualize a better layout and decide the location of furniture for your new home"]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["LandingPageBg.svg"])
    # little twist to make it work equally with an asset or a url
    # meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end
