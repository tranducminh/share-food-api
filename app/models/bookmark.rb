class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :active, allow_nil: false, inclusion: {presence: true, in: [true, false]}

  scope :filter_post, ->(post_id) { where post_id: post_id}
  scope :filter_user, ->(user_id) { where user_id: user_id}
  scope :filter_active, ->(active) { where active: active}
end
