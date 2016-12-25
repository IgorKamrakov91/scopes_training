json.extract! event, :id, :clocked_in, :clocked_out, :created_at, :updated_at
json.url event_url(event, format: :json)