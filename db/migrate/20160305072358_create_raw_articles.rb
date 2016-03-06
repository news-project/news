class CreateRawArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :raw_articles do |t|
      t.integer :press_id, null: false
      t.string :title, null: false
      t.string :link, null: false
      t.text :description
      t.text :page
      t.integer :page_fetch_error_count, default: 0, null: false
      t.datetime :page_fetched_at
      t.string :author
      t.string :category
      t.datetime :date
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :raw_articles, :press_id
    add_index :raw_articles, :link
    add_index :raw_articles, :page_fetched_at
  end
end
