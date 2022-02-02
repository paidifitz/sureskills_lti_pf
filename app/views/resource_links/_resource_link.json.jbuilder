json.extract! resource_link, :id, :title, :description, :tool_link_url, :login_url, :role, :platform_id, :created_at, :updated_at
json.url resource_link_url(resource_link, format: :json)
