class Member < ApplicationRecord
  has_one :website
  validates_presence_of :name
end
