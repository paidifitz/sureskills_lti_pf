class Platform < ApplicationRecord
  has_many :platform_keys
  has_many :contexts
  has_many :resource_links
end