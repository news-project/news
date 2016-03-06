# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'news@news.com', name: '관리자', password: 'localhost', admin: true)

Press.create(name: '경향신문',
             rss_url: 'http://www.khan.co.kr/rss/rssdata/politic_news.xml',
             homepage_url: 'http://www.khan.co.kr',
             category: :politics,
             title_selector: '.art_header .subject h1',
             content_selector: '.art_cont .art_body',
             ad_selector: '#photoAD, .article_bottom_ad',
             image_selector: ".art_photo_wrap img"
            )

Press.create(name: '조선일보',
             rss_url: 'http://www.chosun.com/site/data/rss/politics.xml',
             homepage_url: 'http://www.chosun.com',
             category: :politics,
             title_selector: 'h1#news_title_text_id',
             content_selector: '#news_body_id .par',
             ad_selector: '',
             image_selector: ".news_imgbox img"
            )

Press.create(name: '한겨례',
             rss_url: 'http://www.hani.co.kr/rss/politics',
             homepage_url: 'http://www.hani.co.kr/',
             category: :politics,
             title_selector: '#article_view_headline span.title',
             content_selector: '.article-text .text',
             ad_selector: '',
             image_selector: ".image-area img"
            )

Press.create(name: '중앙일보',
             rss_url: 'http://rss.joins.com/joins_politics_list.xml',
             homepage_url: 'http://joongang.joins.com',
             category: :politics,
             title_selector: '.article_head h1',
             content_selector: '#content #article_body',
             ad_selector: '#criteo_network',
             image_selector: "#content #article_body img"
            )

Press.create(name: '동아일보',
             rss_url: 'http://rss.donga.com/politics.xml',
             homepage_url: 'http://www.donga.com',
             category: :politics,
             title_selector: '#container h1',
             content_selector: '#contents .article_txt',
             ad_selector: '#adBox',
             image_selector: "#contents .article_txt img"
            )
# 동아일보 Nokogiri에서 #articleBody 찾지 못하는 이슈

Rails.logger.info "Acuumulating recent feeds..."
Press.accumulate_recent_feeds

Rails.logger.info "Fetching page HTML..."
RawArticle.fetch_pages

Rails.logger.info "Parsing raw article data... "
RawArticle.spawn_articles
