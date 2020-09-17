require 'rails_helper'
RSpec.describe Heading, type: :model do
  # associations
  it { should belong_to(:website) }

  # validations
  it { should validate_presence_of(:content) }
end

