class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.integer :press_id
      t.integer :raw_article_id
      t.string :title
      t.string :subtitle
      t.string :content
      t.string :images, array: true, default: []
      t.string :link
      t.datetime :published_at

      t.timestamps
    end

    add_index :articles, [:press_id, :published_at]
    add_index :articles, :raw_article_id
    add_index :articles, :title
    add_index :articles, :published_at
  end
end
