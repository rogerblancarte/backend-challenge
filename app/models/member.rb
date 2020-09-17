class Member < ApplicationRecord
  validates_presence_of :name
  has_one :website, dependent: :destroy
end
