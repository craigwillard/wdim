class Avatar < ActiveRecord::Base
  has_attached_file     :image,
                          path: ':rails_root/public/stage/:user/:basename_:style.:extension',
                          url: '/stage/:user/:basename_:style.:extension',
                          whiny: false,
                          styles: {
                            :thumb => "150x150>"
                          }

  belongs_to            :user

  validates             :name,
                          presence: true

  validates             :title,
                          presence: true

  validates_attachment  :image,
                          presence: true,
                          content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/png'] },
                          size: { in: 0..1.megabytes }

  attr_accessible       :active, :location, :name, :signature, :title, :user_id, :image

  after_save            :check_active

  def check_active
    if self.active_changed? && self.active == true
      user = self.user
      avatars = user.avatars.where('id != ? AND active == ?', self.id, true)
      avatars.update_all(active: false)
    end
  end
end
