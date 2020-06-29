json.extract! memo, :id, :user_id, :emoji_id, :title, :content, :created_at, :updated_at
json.url memo_url(memo, format: :json)
