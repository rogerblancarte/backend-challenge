require 'nokogiri'
require 'open-uri'

class ScrapeService < ApplicationService
  attr_reader :website

  def initialize(website)
    @website = website
  end

  def call
    # make the connection using open-uri to the website
    html = open(@website.url)

    # parse the sites html
    doc  = Nokogiri::HTML(html)

    # only grab the h1-h3 tags and create a heading from each one
    doc.css('h1, h2, h3').map do |h|
      Heading.create({
        content: h,
        website: @website
      })
    end
  end
end
