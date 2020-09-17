class Website < ApplicationRecord
  validates_presence_of :url

  belongs_to :member
  has_many   :headings, dependent: :destroy

  after_create :scrape_headings

  private

  # send the newly created website object to be scraped
  # for headings and create the associations
  def scrape_headings
    ScrapeService.call self
  end
end
