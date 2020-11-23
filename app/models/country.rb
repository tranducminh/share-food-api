class Country < ApplicationRecord
  has_many :posts, dependent: :nullify

  validates :name, presence: true,
    allow_nil: false,
    uniqueness: true,
    length: {maximum: Settings.validations.country.name.max_length}
  validates :active, allow_nil: false, inclusion: {presence: true, in: [true, false]}
end
