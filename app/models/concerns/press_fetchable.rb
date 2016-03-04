require 'open-uri'
require 'rss'

# rss를 주소를 바탕으로 data를 fetch한다.
module PressFetchable
  extend ActiveSupport::Concern

  def fetch_feed_itmes
    rss = Feedjira::Feed.fetch_and_parse(rss_url)
    Feed.new(rss)
  end

  class Feed
    attr_accessor :items, :last_build_date

    def initialize(feedjira_rss)
      @last_build_date = if feedjira_rss.last_modified.is_a? String
                           Time.parse(feedjira_rss.last_modified)
                         else
                           feedjira_rss.last_modified
                         end

      @items = []
      feedjira_rss.entries.each do |entry|
        @items << FeedItem.new(entry)
      end
    end

    class FeedItem
      attr_accessor :title, :date, :link, :description, :author, :category

      def initialize(entry)
        @title = entry.title
        @date = entry.published
        @link = entry.url
        @description = entry.summary
        @author = entry.author
      end

      def to_hash
        hashed = {}
        [:title, :date, :link, :description, :author, :category].each do |k|
          hashed[k] = send(k)
        end
        hashed
      end
    end
  end
end
