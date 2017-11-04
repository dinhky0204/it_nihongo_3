module LikesHelper
  def find_like user_id, review_id
    Like.where(user_id:user_id, review_id:review_id)
  end
end
