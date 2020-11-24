class UserFormat < Grape::Entity
  expose :id
  expose :email
  expose :name
  expose :gender
  expose :birthday
  expose :avatar
end
