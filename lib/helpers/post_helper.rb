module PostHelper
  include AuthHelper

  def valid_user post_id
    post = valid_request post_id
    return true if post.user_id == current_user.id

    error!(I18n.t("errors.invalid_user"), :bad_request)
  end

  def valid_post post_id
    post = Post.find_by id: post_id
    error!(I18n.t("errors.post_id_not_found"), :bad_request) unless post
    post
  end
end