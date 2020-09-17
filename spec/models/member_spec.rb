require 'rails_helper'
RSpec.describe Member, type: :model do
  # associations
  it { should have_one(:website).dependent(:destroy) }

  # validations
  it { should validate_presence_of(:name) }
end
