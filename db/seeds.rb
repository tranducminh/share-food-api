Country.create(name: "Vietnam")
Country.create(name: "Japanese")

FoodType.create(name: "Appetizer")
FoodType.create(name: "Desert")

User.create(
  name: "Tran Duc Minh",
  email: "tranducminh@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  is_admin: true
)

Post.create(
  title: "The most specific food in Vietnam",
  food_name: "Banh mi",
  user_id: 1,
  food_type_id: 2,
  country_id: 1,
  image: "/",
  content: "It's so delicious",
  is_confirm: true
)
