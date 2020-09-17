class Website < ApplicationRecord
  validates_presence_of :url
  belongs_to :member
end
