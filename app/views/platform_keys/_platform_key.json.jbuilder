json.extract! platform_key, :id, :name, :deployment_id, :platform_id, :created_at, :updated_at
json.url platform_platform_key_url(@platform, platform_key, format: :json)
