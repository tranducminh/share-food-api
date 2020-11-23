class AuthApi < ApiV1
  namespace :auth do
    before do
      @user = get_user_by_email
    end

    desc "Log in"
    post "/login" do
      return 'successfully'
    end
  end
end
