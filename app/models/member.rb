class Member < ApplicationRecord
  validates_presence_of :name

  has_one  :website, dependent: :destroy
  has_many :headings, through: :website

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, source: :member
end
