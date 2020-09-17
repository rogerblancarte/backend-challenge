class Website < ApplicationRecord
  validates_presence_of :url

  belongs_to :member
  has_many   :headings, dependent: :destroy
end
