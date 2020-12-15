class PostApi < ApiV1
  namespace :posts do
    desc "get all post which not be confirmed for admin"
    get "/unconfirmed" do
      valid_admin
      posts = Post.all.filter_confirm(false)
      render_success_response(:ok, UnconfirmPostFormat, posts, I18n.t("success.get_post"))
    end

    desc "only admin can confirm a post"
    put "/:id/confirm" do
      valid_admin
      post = valid_post params[:id]
      if post = Post.update(params[:id], {is_confirm: true})
        render_success_response(:ok, UnconfirmPostFormat, post, I18n.t("success.update"))
      else
        error! I18n.t("errors.update"), :bad_request
      end
    end

    desc "post details"
    get "/:id" do
      post = valid_post params[:id]
      post.bookmark_quantity = Bookmark.filter_post(post.id).filter_active(true).count
        if Bookmark.find_by(post_id: post.id, user_id: current_user.id, active: true)
          post.is_bookmarked = true
        else
          post.is_bookmarked = false
        end
      if post.is_confirm == true
        render_success_response(:ok, ConfirmPostFormat, post, I18n.t("success.get_post"))
      else 
        valid_admin
        render_success_response(:ok, ConfirmPostFormat, post, I18n.t("success.get_post"))
      end
    end

    desc "get all post for user"
    params do
      optional :country_id, type: String, allow_blank: false
      optional :food_type_id, type: String, allow_blank: false
    end
    get "/" do
      posts = Post.filter_confirm(true)
      posts = posts.filter_country(params[:country_id]) if params[:country_id]
      posts = posts.filter_food_type(params[:food_type_id]) if params[:food_type_id]
      
      for post in posts
        post.bookmark_quantity = Bookmark.filter_post(post.id).filter_active(true).count
        if Bookmark.find_by(post_id: post.id, user_id: current_user.id, active: true)
          post.is_bookmarked = true
        else
          post.is_bookmarked = false
        end
      end
      render_success_response(:ok, ConfirmPostFormat, posts, I18n.t("success.get_post"))
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
        return render_success_response(:ok, UnconfirmPostFormat, post, I18n.t("success.signup"))
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
      post = valid_post params[:id]
      error! I18n.t("errors.update"), :bad_request unless post.is_confirm == false

      data = valid_params(params, Post::PARAMS)
      if post = Post.update(params[:id], data)
        render_success_response(:ok, UnconfirmPostFormat, post, I18n.t("success.update"))
      else
        error! I18n.t("errors.update"), :bad_request
      end
    end
  end
end