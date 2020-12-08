class ApiV1 < Grape::API
  format :json
  prefix :api
  version "v1", using: :path

  mount AuthApi
  mount PostApi
  mount UserApi
  mount ResetPasswordApi
  mount BookmarkApi
  mount CountryApi
  mount FoodTypeApi
end
