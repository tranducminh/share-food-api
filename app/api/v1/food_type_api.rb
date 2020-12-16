class FoodTypeApi < ApiV1
  namespace :food_types do
    desc "get all food types"
    get "/" do
      render_success_response(:ok, FoodTypeFormat, FoodType.filter_active(true), I18n.t("success.get_food_type"))
    end

    desc "create a food type"
    params do
      requires :name, type: String, message: I18n.t("errors.required")
    end
    post "/" do
      authenticated
      food_type = FoodType.create({name: params[:name]})
      if food_type.valid?
        return render_success_response(:ok, FoodTypeFormat, food_type, I18n.t("success.get_country"))
      else
          error!(I18n.t("errors.uncessfull"), :bad_request)
      end
    end
  end
end