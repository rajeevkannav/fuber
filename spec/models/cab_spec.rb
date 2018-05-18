require 'rails_helper'

RSpec.describe Cab, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context "associations" do
    it {should have_many(:journeys)}
  end

  context "validations" do
    it { should validate_presence_of(:position_x) }
    it { should validate_presence_of(:position_y) }
  end
end
