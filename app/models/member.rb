class Member < ApplicationRecord
  validates_presence_of :name

  has_one  :website, dependent: :destroy
  has_many :headings, through: :website
end
