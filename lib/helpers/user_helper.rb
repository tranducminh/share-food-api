module UserHelper
  def get_user_by_email
    user = User.find_by email: params[:email]
    error!(I18n.t("errors.user_not_found"), :bad_request) unless user
    user
  end

  def get_user_by_id
    user = User.find_by id: params[:id]
    error!(I18n.t("errors.user_not_found"), :bad_request) unless user
    user
  end

  def valid_admin
    error!(I18n.t("errors.invalid_user"), :forbidden) unless current_user.is_admin == true
  end
end
