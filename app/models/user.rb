class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.validations.user.email.regex
  PARAMS = %i(name email password password_confirmation).freeze

  has_many :posts, dependent: :nullify
  has_many :bookmarks, dependent: :nullify

  validates :name, presence: true, allow_nil: false,
    length: {maximum: Settings.validations.user.name.max_length}
  validates :email, presence: true, allow_nil: false,
    length: {maximum: Settings.validations.user.email.max_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness:  {case_sensitive: false}
  validates :birthday, presence: true,
    allow_nil: true
  validates :avatar, presence: true,
    allow_nil: true
  validates :gender, allow_nil: true, inclusion: {presence: true, in: [0, 1]}
  validates :is_admin, allow_nil: false, inclusion: {presence: true, in: [true, false]}

  before_save :downcase_email

  has_secure_password

  class << self
    def digest string
      cost =
        if ActiveModel::SecurePassword.min_cost
          BCrypt::Engine::MIN_COST
        else
          BCrypt::Engine.cost
        end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  private

  def downcase_email
    email.downcase!
  end
end
