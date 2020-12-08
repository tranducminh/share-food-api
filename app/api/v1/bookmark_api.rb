class BookmarkApi < ApiV1
  namespace :bookmarks do
    before do
      authenticated
    end

    desc "get all my bookmark posts"
    get "/all" do
      bookmarks = Bookmark.filter_user(current_user.id).filter_active(true)
      posts = []
      for bookmark in bookmarks
        temp = bookmark.post
        temp.is_bookmarked = true
        temp.bookmark_quantity = Bookmark.filter_post(temp.id).count
        posts.push(temp)
      end
      render_success_response(:ok, ConfirmPostFormat, posts, I18n.t("success.get_post"))
    end

    desc "bookmark a post"
    params do
      requires :post_id, type: Integer, message: I18n.t("errors.required")
    end
    post "/" do
      if bookmark = Bookmark.find_by(post_id: params[:post_id], user_id: current_user.id)
        if bookmark.active == false
          Bookmark.update(bookmark.id, {active: true})
        end
        return render_success_response(:ok, BookmarkFormat, bookmark, I18n.t("success.bookmark"))
      else
        data = {}
        data[:post_id] = params[:post_id]
        data[:user_id] = current_user.id
        bookmark = Bookmark.create data
        if bookmark.valid?
          return render_success_response(:ok, BookmarkFormat, bookmark, I18n.t("success.bookmark"))
        else
          error!(I18n.t("errors.uncessfull"), :bad_request)
        end
      end
    end

    desc "unbookmark a post"
    params do
      requires :post_id, type: Integer, message: I18n.t("errors.required")
    end
    delete "/" do
      if bookmark = Bookmark.find_by(post_id: params[:post_id], user_id: current_user.id)
        if bookmark.active == true
          Bookmark.update(bookmark.id, {active: false})
        end
        return render_success_response(:ok, BookmarkFormat, bookmark, I18n.t("success.bookmark"))
      else
        error!(I18n.t("errors.uncessfull"), :bad_request)
      end
    end
  end
end