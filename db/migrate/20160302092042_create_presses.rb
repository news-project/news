class CreatePresses < ActiveRecord::Migration[5.0]
  def change
    create_table :presses do |t|
      t.string :name
      t.string :rss_url
      t.string :homepage_url
      t.string :category
      t.string :content_selector
      t.string :title_selector
      t.string :subtitle_selector
      t.string :image_selector
      t.string :ad_selector
      t.datetime :last_build_date
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :presses, :name
    add_index :presses, :category
  end
end
