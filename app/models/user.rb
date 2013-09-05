class User < ActiveRecord::Base
  belongs_to :messages
  belongs_to :avatars
  attr_accessible :active, :aim, :at_work, :email, :first_name, :last_name, :member_since, :old_id, :password_digest, :posts_count, :user_type, :username
end
