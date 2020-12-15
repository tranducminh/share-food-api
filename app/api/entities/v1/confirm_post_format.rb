class ConfirmPostFormat < Grape::Entity
  expose :id
  expose :user_name
  expose :user_avatar
  expose :title
  expose :food_name
  expose :country_name
  expose :food_type_name
  expose :image
  expose :content
  expose :is_confirm
  expose :bookmark_quantity
  expose :is_bookmarked
end
