class Post < ApplicationRecord
  belongs_to :user
  belongs_to :country
  belongs_to :food_type
  has_many :bookmarks, dependent: :nullify

  validates :title, presence: true, allow_nil: false,
    length: {maximum: Settings.validations.post.title.max_length}
  validates :content, presence: true, allow_nil: false,
    length: {maximum: Settings.validations.post.content.max_length}
  validates :food_name, presence: true, allow_nil: false,
    length: {maximum: Settings.validations.post.food_name.max_length}
  validates :avatar, presence: true,
    allow_nil: true
  validates :is_confirm, allow_nil: false, inclusion: {presence: true, in: [true, false]}
  validates :active, allow_nil: false, inclusion: {presence: true, in: [true, false]}
end
