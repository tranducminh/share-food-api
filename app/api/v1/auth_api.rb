class AuthApi < ApiV1
  namespace :auth do
    before do
    end

    desc "Log in"
    post "/login" do
      return "successfully"
    end
  end
end
