namespace :news do
  task fetch_recent_feed: :environment do
    Press.accumulate_recent_feeds
    RawArticle.fetch_pages
    RawArticle.spawn_articles
  end
end
