class CountryApi < ApiV1
  namespace :countries do
    desc "get all country"
    get "/" do
      render_success_response(:ok, CountryFormat, Country.filter_active(true), I18n.t("success.get_country"))
    end

    desc "create a country"
    params do
      requires :name, type: String, message: I18n.t("errors.required")
    end
    post "/" do
      authenticated
      country = Country.create({name: params[:name]})
      if country.valid?
        return render_success_response(:ok, CountryFormat, country, I18n.t("success.get_country"))
      else
          error!(I18n.t("errors.uncessfull"), :bad_request)
      end
    end
  end
end