class Banner < ActiveRecord::Base
  has_attached_file :image

  validates         :title,
                      presence: true,
                      length: { minimum: 2 }

  validates_attachment  :image,
                          presence: true

  attr_accessible   :old_id, :title, :image
end