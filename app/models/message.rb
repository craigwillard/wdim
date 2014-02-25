class Message < ActiveRecord::Base

  has_ancestry

  belongs_to            :user

  validates             :user_id,
                          presence: true

  validates             :title,
                          presence: true

  before_save           :update_caches

  attr_accessible       :body, :date, :last_post_date, :last_post_id, :old_id, :reply_count, :title, :user_id

  def update_caches
    self.date = Time.now
  end
end
