class UserApi < ApiV1
  # rubocop:disable Metrics/BlockLength
  namespace :auth do
    desc "Sign up"
    params do
      requires :name, type: String, message: I18n.t("errors.required")
      requires :email, type: String, message: I18n.t("errors.required")
      requires :password, type: String, message: I18n.t("errors.required")
      requires :password_confirmation, type: String, same_as: :password, message: I18n.t("errors.required")
    end
    post "/signup" do
      data = valid_params(params, User::PARAMS)
      data[:is_admin] = false
      user = User.create data
      if user.valid?
        token = encode_token({user_id: user.id})
        set_cookie token
        return render_success_response(:ok, AuthFormat, {token: token, user: user}, I18n.t("success.signup"))
      else
        error!(user.errors.full_messages[0], :bad_request)
      end
    end
  end

  namespace :profile do
    before do
      authenticated
    end

    desc "Show profile"
    get "/" do
      return render_success_response(:ok, UserFormat, current_user, I18n.t("success.signup"))
    end

    desc "Update profile"
    params do
      optional :name, type: String, allow_blank: false
      optional :birthday, type: String, allow_blank: false
      optional :gender, type: String, allow_blank: false
      optional :avatar, type: String, allow_blank: false
    end
    put "/" do
      data = valid_params(params, User::UPDATE_PROFILE_PARAMS)
      if user = User.update(current_user.id, data)
        render_success_response(:ok, UserFormat, user, I18n.t("success.update"))
      else
        error!(I18n.t("errors.update"), :bad_request)
      end
    end
  end
end