require 'rails_helper'

RSpec.describe Category, type: :model do
  # Assocation tests
  it { should have_many(:books) }

  # validation tests
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(3) }

end
