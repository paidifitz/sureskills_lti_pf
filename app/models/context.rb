class Context < ApplicationRecord
  belongs_to :platform
  has_many :resource_links
  has_many :students
end
