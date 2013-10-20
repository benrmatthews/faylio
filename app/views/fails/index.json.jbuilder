json.array!(@fails) do |fail|
  json.extract! fail, :headline, :description, :lesson, :link, :user_id
  json.url fail_url(fail, format: :json)
end