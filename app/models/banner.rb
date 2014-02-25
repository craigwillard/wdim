class Banner < ActiveRecord::Base
  has_attached_file     :image,
                          path: ':rails_root/public/stage/banners/:banner.:extension',
                          url: '/stage/banners/:banner.:extension',
                          whiny: false,
                          styles: {
                            :default => "780x100>"
                          }

  validates             :title,
                          presence: true,
                          length: { minimum: 2 }

  validates_attachment  :image,
                          presence: true

  attr_accessible       :old_id, :title, :image
end