class User < ActiveRecord::Base
  USER_TYPES =        ["admin", "default"].freeze

  has_secure_password

  has_many            :avatars
  # has_many            :messages

  validates           :username,
                        presence: true,
                        length: { minimum: 2, maximum: 45 }

  validates           :password,
                        presence: true,
                        length: { minimum: 5, maximum: 25 },
                        on: :create

  validates           :first_name,
                        presence: true,
                        length: { minimum: 2, maximum: 45 }

  validates           :last_name,
                        presence: true,
                        length: { minimum: 2, maximum: 45 }

  validates           :email,
                        presence: true,
                        format: {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates           :user_type,
                        presence: true,
                        inclusion: { in: User::USER_TYPES }

  attr_accessible     :active, :aim, :at_work, :email, :first_name, :last_name, :member_since, :old_id, :password_digest, :posts_count, :user_type, :username, :password, :password_confirmation

  before_validation   :set_user_type,
                        on: :create

  def set_user_type
    if self.user_type.nil?
      self.user_type = "default"
    end
  end
end
