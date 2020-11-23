class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.validations.user.email.regex

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
  validates :gender, allow_nil: false, inclusion: {presence: true, in: [0, 1]}
  validates :is_admin, allow_nil: false, inclusion: {presence: true, in: [true, false]}
  validates :active, allow_nil: false, inclusion: {presence: true, in: [true, false]}
end
