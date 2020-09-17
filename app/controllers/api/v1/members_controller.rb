class Api::V1::MembersController < ApplicationController
  before_action :set_member, only: [:show]

  def index
    @members = Member.all
    json_response(@members)
  end

  def show
    json_response(@member)
  end

  def create
    @member = Member.create!(member_params)
    json_response(@member, :created)
  end

  private

  def member_params
    params.permit(:name)
  end

  def set_member
    @member = Member.find(params[:id])
  end
end
