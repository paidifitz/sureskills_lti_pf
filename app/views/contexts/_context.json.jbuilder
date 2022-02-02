json.extract! context, :id, :label, :title, :context_type, :platform_id, :created_at, :updated_at
json.url context_url(context, format: :json)
