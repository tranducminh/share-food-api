class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :active, allow_nil: false, inclusion: {presence: true, in: [true, false]}
end
