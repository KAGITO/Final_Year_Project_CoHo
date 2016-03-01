json.array!(@tags) do |tag|
  json.extract! tag, :id, :question_id, :name, :user_id
  json.url tag_url(tag, format: :json)
end
