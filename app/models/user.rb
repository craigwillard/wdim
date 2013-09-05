class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, on: :create

  belongs_to :messages
  belongs_to :avatars

  attr_accessible :active, :aim, :at_work, :email, :first_name, :last_name, :member_since, :old_id, :password_digest, :posts_count, :user_type, :username, :password, :password_confirmation
end
