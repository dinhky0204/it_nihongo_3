json.extract! game, :id, :name, :story, :description, :guide, :publisher_id, :created_at, :updated_at
json.url game_url(game, format: :json)
