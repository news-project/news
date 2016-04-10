class CreateJournalists < ActiveRecord::Migration[5.0]
  def change
    create_table :journalists do |t|
      t.integer :press_id
      t.string :name
      t.string :email

      t.timestamps
    end

    add_column :articles, :journalist_id, :integer
  end
end
