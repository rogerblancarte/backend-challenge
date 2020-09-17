class Heading < ApplicationRecord
  validates_presence_of :content
  belongs_to :website
end
