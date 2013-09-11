class User < ActiveRecord::Base
  has_secure_password

  has_many          :avatars
  # has_many          :messages

  validates         :username,
                      presence: true,
                      length: { minimum: 2, maximum: 45 }

  validates         :password,
                      presence: true,
                      length: { minimum: 5, maximum: 25 },
                      on: :create

  validates         :first_name,
                      presence: true,
                      length: { minimum: 2, maximum: 45 }

  validates         :last_name,
                      presence: true,
                      length: { minimum: 2, maximum: 45 }

  validates         :email,
                      presence: true,
                      format: {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  attr_accessible   :active, :aim, :at_work, :email, :first_name, :last_name, :member_since, :old_id, :password_digest, :posts_count, :user_type, :username, :password, :password_confirmation
end
