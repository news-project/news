# 뉴스 RSS 정보를 담는 모델
class Press < ApplicationRecord
  include PressFetchable

  enum category: [:politics, :world, :society]

  has_many :raw_articles
  has_many :articles

  validates :name, :rss_url, presence: true
  validates :rss_url, uniqueness: true

  class << self
    def accumulate_recent_feeds
      find_each do |press|
        press.create_raw_articles_by_feed
      end
    end
  end

  def create_raw_articles_by_feed
    feed = fetch_feed_itmes
    return unless feed.last_build_date.to_i > last_build_date.to_i
    feed.items.each do |item|
      raw_articles.create(item.to_hash)
    end
    update(last_build_date: feed.last_build_date)
    last_build_date
  end
end

# == Schema Information
#
# Table name: presses
#
#  id                :integer          not null, primary key
#  name              :string
#  rss_url           :string
#  homepage_url      :string
#  category          :string
#  content_selector  :string
#  title_selector    :string
#  subtitle_selector :string
#  image_selector    :string
#  ad_selector       :string
#  last_build_date   :datetime
#  deleted_at        :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_presses_on_category  (category)
#  index_presses_on_name      (name)
#
