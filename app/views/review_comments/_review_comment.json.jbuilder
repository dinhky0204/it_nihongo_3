json.extract! review_comment, :id, :user_id, :review_id, :content, :created_at, :updated_at
json.url review_comment_url(review_comment, format: :json)
