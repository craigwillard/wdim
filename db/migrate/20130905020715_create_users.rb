class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :user_type
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :aim
      t.date :member_since
      t.integer :posts_count
      t.boolean :at_work
      t.boolean :active
      t.references :messages
      t.references :avatars
      t.integer :old_id

      t.timestamps
    end
    add_index :users, :messages_id
    add_index :users, :avatars_id
  end
end
