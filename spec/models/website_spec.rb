require 'rails_helper'
RSpec.describe Website, type: :model do
  # associations
  it { should belong_to(:member) }

  # validations
  it { should validate_presence_of(:url) }
end
