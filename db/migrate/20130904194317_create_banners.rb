class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.integer :old_id

      t.timestamps
    end
  end
end
