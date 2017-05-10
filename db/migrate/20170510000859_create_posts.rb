class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :id_str
      t.string :type
      t.string :post_type
      t.string :screen_name
      t.integer :connection_account_id
      t.text :post_text
      t.jsonb :blacklisted_words, default: []
      t.date :post_created_at_date

      t.timestamps
    end
  end
end
