json.extract! post, :id, :postable_id, :postable_type, :user_id, :body, :created_at, :updated_at
json.url post_url(post, format: :json)
