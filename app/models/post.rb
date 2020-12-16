class Post < ApplicationRecord
  PARAMS = %i(title food_name food_type_id country_id image content).freeze

  belongs_to :user
  belongs_to :country
  belongs_to :food_type
  has_many :bookmarks, dependent: :nullify

  delegate :name, :avatar, to: :user, prefix: true
  delegate :name, to: :country, prefix: true
  delegate :name, to: :food_type, prefix: true

  attr_accessor :bookmark_quantity
  attr_accessor :is_bookmarked

  scope :filter_confirm, ->(is_confirm) { where is_confirm: is_confirm}
  scope :filter_user, ->(user_id) { where user_id: user_id}
  scope :filter_country, ->(country_id) { where country_id: country_id}
  scope :filter_food_type, ->(food_type_id) { where food_type_id: food_type_id}

  validates :title, presence: true, allow_nil: false
  validates :content, presence: true, allow_nil: false
  validates :food_name, presence: true, allow_nil: false,
    length: {maximum: Settings.validations.post.food_name.max_length}
  validates :image, presence: true,
    allow_nil: true
  validates :is_confirm, allow_nil: false, inclusion: {presence: true, in: [true, false]}
  validates :active, allow_nil: false, inclusion: {presence: true, in: [true, false]}
end
