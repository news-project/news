class Article < ApplicationRecord
  # 태깅: https://github.com/mbleigh/acts-as-taggable-on
  acts_as_taggable

  belongs_to :press
  belongs_to :raw_article

  validates :title, presence: true
end

# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  press_id       :integer
#  raw_article_id :integer
#  title          :string
#  subtitle       :string
#  content        :string
#  images         :string           default([]), is an Array
#  link           :string
#  published_at   :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_articles_on_press_id_and_published_at  (press_id,published_at)
#  index_articles_on_published_at               (published_at)
#  index_articles_on_raw_article_id             (raw_article_id)
#  index_articles_on_title                      (title)
#
