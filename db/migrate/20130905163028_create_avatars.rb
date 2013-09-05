class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :name
      t.boolean :active
      t.text :signature
      t.string :title
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
