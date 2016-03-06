module PageParserable
  CONTENT_IGNORE_SELECTOR = 'script, iframe'

  def page_title
    return unless html_tree
    return unless title_selector.present?
    html_tree.css(title_selector).inner_text.squish
  end

  def page_subtitle
    return unless html_tree
    return unless subtitle_selector.present?
    html_tree.css(subtitle_selector).inner_text.squish
  end

  def page_content
    return unless html_tree
    return unless content_selector.present?
    duped_tree = html_tree.dup
    duped_tree.css(CONTENT_IGNORE_SELECTOR).remove
    duped_tree.css(ad_selector).remove if ad_selector.present?
    duped_tree.css(content_selector).inner_text.squish
  end

  def page_images
    return unless html_tree
    html_tree.css(image_selector)
      .map { |img_tag| img_tag['src'] }
      .reject { |src| src.to_s.match(/\.gif$/) }
  end

  private

  def html_tree
    return unless page.present?
    @html_tree ||= Nokogiri::HTML(page)
  end
end
