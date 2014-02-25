class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.datetime :date
      t.integer :user_id
      t.datetime :last_post_date
      t.integer :last_post_id
      t.integer :reply_count
      t.integer :old_id

      t.timestamps
    end
  end
end
