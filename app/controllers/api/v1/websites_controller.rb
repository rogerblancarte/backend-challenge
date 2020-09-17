class Api::V1::WebsitesController < ApplicationController
  before_action :set_member
  before_action :set_website, only: [:index, :show]

  def index
    json_response(@website)
  end

  def show
    json_response(@website)
  end

  def create
    @website = Website.create!(website_params)
    json_response(@website, :created)
  end

  private

  def website_params
    params.permit(:member_id, :url)
  end

  def set_member
    @member = Member.find(params[:member_id])
  end

  def set_website
    @website = @member.website if @member
  end
end
