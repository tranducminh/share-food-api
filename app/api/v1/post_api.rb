class PostApi < ApiV1
  namespace :posts do
    desc "post details"
    get "/:id" do
      post = valid_post params[:id]
      render_success_response(:ok, PostFormat, post, I18n.t("success.get_post"))
    end

    desc "get all post for user"
    get "/" do
      posts = Post.all.filter_confirm(true)
      render_success_response(:ok, PostFormat, posts, I18n.t("success.get_post"))
    end

    desc "create post"
    params do
      requires :title, type: String, message: I18n.t("errors.required")
      requires :food_name, type: String, message: I18n.t("errors.required")
      requires :food_type_id, type: Integer, message: I18n.t("errors.required")
      requires :country_id, type: Integer, message: I18n.t("errors.required")
      optional :image, type: String
      requires :content, type: String, message: I18n.t("errors.required")
    end
    post "/" do
      data = valid_params(params, Post::PARAMS)
      data[:user_id] = current_user.id
      data[:is_confirm] = false
      post = Post.create data
      if post.valid?
        return render_success_response(:ok, PostFormat, post, I18n.t("success.signup"))
      else
        error!(I18n.t("errors.update"), :bad_request)
      end
    end

    desc "Update post if post has not been confirmed yet"
    params do
      optional :title, type: String, allow_blank: false
      optional :food_name, type: String, allow_blank: false
      optional :food_type_id, type: Integer, allow_blank: false
      optional :country_id, type: Integer, allow_blank: false
      optional :image, type: String
      optional :content, type: String, allow_blank: false
    end
    put "/:id/update" do
      valid_user params[:id]
      valid_post params[:id]
      error! I18n.t("errors.update"), :bad_request unless post.is_confirm == false

      data = valid_params(params, Post::PARAMS)
      if request = Request.update(params[:id], data)
        render_success_response(:ok, PostFormat, post, I18n.t("success.update"))
      else
        error! I18n.t("errors.update"), :bad_request
      end
    end
  end
end