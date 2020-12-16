Country.create(name: "Vietnam")
Country.create(name: "Japanese")
Country.create(name: "Austria")
Country.create(name: "Brazil")
Country.create(name: "Laos")
Country.create(name: "Philippines")
Country.create(name: "Russia")
Country.create(name: "America")

FoodType.create(name: "Food")
FoodType.create(name: "Appetizer")
FoodType.create(name: "Desert")
FoodType.create(name: "Fast food")
FoodType.create(name: "Fry")
FoodType.create(name: "Grill")
FoodType.create(name: "Seafood")
FoodType.create(name: "Drink")
FoodType.create(name: "seafood")

User.create(
  name: "Tran Duc Minh",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  is_admin: true
)

User.create(
  name: "Do Manh Hung",
  email: "user1@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  is_admin: false
)

User.create(
  name: "Nguyen Thi Huong Tra",
  email: "user2@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  is_admin: false
)

Post.create(
  title: "Cheese toast on the edge of Campbelltown: What it's like eating at Sizzler in its final week",
  food_name: "Cheese toast",
  user_id: 2,
  food_type_id: 2,
  country_id: 1,
  image: "https://recipe-sharing-bucket.s3-ap-southeast-1.amazonaws.com/1605510759959.jpg",
  content: "<p><br><span style=\"color: rgb(38,38,38);background-color: rgb(255,255,255);font-size: 17px;font-family: Karla, Helvetica, Arial, Verdana, sans-serif;\">In the pantheon of Great Australian Side Dishes, one table mate rules above all. Guillaume Brahimi's Paris mash might be the ultimate accompaniment to beef bourguignon, and Neil Perry's mushy peas should always ride shotgun with a Rockpool steak, but nothing hits all the nostalgia-filled pleasure points like Sizzler's cheese toast.</span></p>\n<p style=\"text-align:left;\"><span style=\"color: rgb(38,38,38);background-color: rgb(255,255,255);font-size: 17px;font-family: Karla, Helvetica, Arial, Verdana, sans-serif;\">Thick-sliced bread, spread with pecorino and margarine, grilled golden-brown on one side. Simple to cook at home, but impossible to replicate, Sizzler's complimentary starter has been on the menu since the buffet chain arrived in Australia from the US in 1985. </span></p>\n",
  is_confirm: true
)

Post.create(
  title: "Dose of sunshine at The Amalfi Way",
  food_name: "Seafood",
  user_id: 2,
  food_type_id: 7,
  country_id: 3,
  image: "https://recipe-sharing-bucket.s3-ap-southeast-1.amazonaws.com/1605663170626.jpg",
  content: "<p><span style=\"color: rgb(38,38,38);background-color: rgb(255,255,255);font-size: 17px;font-family: Karla, Helvetica, Arial, Verdana, sans-serif;\">Suddenly everyone wants to eat outside – and what's the first place in Sydney most people think of when they think of eating outside? Finger Wharf, that pointy digit extending into the harbour from Woolloomooloo.</span></p>\n<p style=\"text-align:left;\"><br><span style=\"color: rgb(38,38,38);background-color: rgb(255,255,255);font-size: 17px;font-family: Karla, Helvetica, Arial, Verdana, sans-serif;\">Suddenly everyone wants to eat outside – and what's the first place in Sydney most people think of when they think of eating outside? Finger Wharf, that pointy digit extending into the harbour from Woolloomooloo.</span></p>\n<p style=\"text-align:left;\"><span style=\"color: rgb(38,38,38);background-color: rgb(255,255,255);font-size: 17px;font-family: Karla, Helvetica, Arial, Verdana, sans-serif;\">One restaurateur on the wharf says his business is up 300 per cent on this time last year, due to the COVID-19 give-me-fresh-air factor.</span></p>\n<p style=\"text-align:left;\"><span style=\"color: rgb(38,38,38);background-color: rgb(255,255,255);font-size: 17px;font-family: Karla, Helvetica, Arial, Verdana, sans-serif;\">Even with Criniti's and Aki's having recently left the pier, there's an irresistibly positive sense of celebration as women in floaty dresses turn the promenade into a fashion catwalk fringed by sunshine, water and boats.</span></p>\n",
  is_confirm: true
)

Post.create(
  title: "Dose of sunshine at The Amalfi Way",
  food_name: "Seafood",
  user_id: 2,
  food_type_id: 5,
  country_id: 3,
  image: "https://recipe-sharing-bucket.s3-ap-southeast-1.amazonaws.com/1572924064785.jpg",
  content: "<p><span style=\"color: rgb(38,38,38);background-color: rgb(255,255,255);font-size: 17px;font-family: Karla, Helvetica, Arial, Verdana, sans-serif;\">Suddenly everyone wants to eat outside – and what's the first place in Sydney most people think of when they think of eating outside? Finger Wharf, that pointy digit extending into the harbour from Woolloomooloo.</span></p>\n<p style=\"text-align:left;\"><br><span style=\"color: rgb(38,38,38);background-color: rgb(255,255,255);font-size: 17px;font-family: Karla, Helvetica, Arial, Verdana, sans-serif;\">Suddenly everyone wants to eat outside – and what's the first place in Sydney most people think of when they think of eating outside? Finger Wharf, that pointy digit extending into the harbour from Woolloomooloo.</span></p>\n<p style=\"text-align:left;\"><span style=\"color: rgb(38,38,38);background-color: rgb(255,255,255);font-size: 17px;font-family: Karla, Helvetica, Arial, Verdana, sans-serif;\">One restaurateur on the wharf says his business is up 300 per cent on this time last year, due to the COVID-19 give-me-fresh-air factor.</span></p>\n<p style=\"text-align:left;\"><span style=\"color: rgb(38,38,38);background-color: rgb(255,255,255);font-size: 17px;font-family: Karla, Helvetica, Arial, Verdana, sans-serif;\">Even with Criniti's and Aki's having recently left the pier, there's an irresistibly positive sense of celebration as women in floaty dresses turn the promenade into a fashion catwalk fringed by sunshine, water and boats.</span></p>\n",
  is_confirm: true
)
