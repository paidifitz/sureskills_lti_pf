class ResourceLink < ApplicationRecord
  belongs_to :platform
  belongs_to :context
end
