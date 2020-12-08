class FoodType < ApplicationRecord
  has_many :posts, dependent: :nullify

  validates :name, presence: true,
    allow_nil: false,
    uniqueness: true,
    length: {maximum: Settings.validations.food_type.name.max_length}
  validates :active, allow_nil: false, inclusion: {presence: true, in: [true, false]}

  scope :filter_active, ->(active) { where active: active}
end
