class User < ActiveRecord::Base
  has_secure_password

  belongs_to :messages
  belongs_to :avatars

  validates       :username,
                    presence: true,
                    length: { minimum: 2, maximum: 45 }

  validates       :password,
                    presence: true,
                    length: { minimum: 5, maximum: 25 },
                    on: :create

  validates       :first_name,
                    presence: true,
                    length: { minimum: 2, maximum: 45 }

  validates       :last_name,
                    presence: true,
                    length: { minimum: 2, maximum: 45 }

  validates       :email,
                    presence: true,
                    format: {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  # validates       :subdomain,
  #                   presence: true,
  #                   uniqueness: {:case_sensitive => false},
  #                   length: { minimum: 2, maximum: 45 }

  # validates       :talent_mode,
  #                   presence: true,
  #                   inclusion: {in: ["system", "local"]}

  # validates       :status,
  #                   presence: true,
  #                   inclusion: { in: STATUSES }

  attr_accessible :active, :aim, :at_work, :email, :first_name, :last_name, :member_since, :old_id, :password_digest, :posts_count, :user_type, :username, :password, :password_confirmation
end
