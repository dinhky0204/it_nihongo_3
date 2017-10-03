json.extract! review, :id, :title, :user_id, :game_id, :content, :photo, :created_at, :updated_at
json.url review_url(review, format: :json)
