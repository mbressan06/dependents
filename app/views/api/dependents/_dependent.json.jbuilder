json.extract! dependent, :id, :name, :kinship_type, :user_id, :created_at, :updated_at
json.url dependent_url(dependent, format: :json)