require 'open-uri'

class RawArticle < ApplicationRecord
  include PageParserable

  belongs_to :press
  has_one :article

  validates :press, :title, :link, presence: true
  validates :link, uniqueness: true

  delegate :title_selector, :subtitle_selector, :content_selector, :image_selector, :ad_selector, to: :press

  class << self
    def fetch_pages
      where(page_fetched_at: nil).find_each do |raw_article|
        begin
          raw_article.fetch_page
        rescue => e
          Rails.logger.warn "#{raw_article.id} is not fetched, #{e.message}"
        end
      end
    end

    def spawn_articles
      includes(:article).find_each do |raw_arti|
        raw_arti.spawn_article
      end
    end
  end

  def fetch_page
    update(page: crawl_page)
  rescue => e
    increment! :page_fetch_error_count
    raise e
  end

  def crawl_page
    result = open(link, &:read)
    if result.match(/charset[\=|\"]*euc-kr/i)
      result = result.force_encoding('EUC-KR').encode('UTF-8')
    end
    result
  end

  def spawn_article(force: false)
    return article if article && !force
    spawned = article || build_article
    spawned.attributes = {
      press: press,
      link: link,
      title: (page_title || title),
      subtitle: page_subtitle,
      content: page_content,
      images: page_images,
      published_at: date
    }
    spawned.save
  end
end

# == Schema Information
#
# Table name: raw_articles
#
#  id                     :integer          not null, primary key
#  press_id               :integer          not null
#  title                  :string           not null
#  link                   :string           not null
#  description            :text
#  page                   :text
#  page_fetch_error_count :integer          default(0), not null
#  page_fetched_at        :datetime
#  author                 :string
#  category               :string
#  date                   :datetime
#  deleted_at             :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_raw_articles_on_link             (link)
#  index_raw_articles_on_page_fetched_at  (page_fetched_at)
#  index_raw_articles_on_press_id         (press_id)
#
