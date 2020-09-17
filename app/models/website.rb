class Website < ApplicationRecord
  validates_presence_of :url

  belongs_to :member
  has_many   :headings, dependent: :destroy

  before_create :shorten_url
  after_create  :scrape_headings

  private

  def shorten_url
    # Didn't make sense as a service since it isn't
    # directly modifying anything related to our domain
    bitly = BitlyUrls.new
    self.shortened_url = bitly.shorten_link(self.url)
  end

  # send the newly created website object to be scraped
  # for headings and create the associations
  def scrape_headings
    ScrapeService.call self
  end
end
