class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.validations.user.email.regex
  PARAMS = %i(name email password password_confirmation).freeze
  UPDATE_PROFILE_PARAMS = %i(name gender birthday avatar).freeze

  attr_accessor :reset_token
  
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

  def create_reset_digest
    self.reset_token = User.new_token
    update reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < Settings.expire_token_time.hours.ago
  end

  def valid_reset_password? token
    digest = send :reset_digest
    return false unless digest

    BCrypt::Password.new(digest).is_password? token
  end

  private

  def downcase_email
    email.downcase!
  end
end
