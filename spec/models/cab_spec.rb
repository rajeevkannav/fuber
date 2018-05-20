require 'rails_helper'

RSpec.describe Cab, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context "associations" do
    it {should have_many(:journeys)}
  end

  context "validations" do
    it {should validate_presence_of(:position_x)}
    it {should validate_presence_of(:position_y)}
  end

  describe 'Get the Closets Cab' do

    before(:each) do
      customer = Customer.create(name: 'Sample Customer')
      @other_cab_1 = Cab.create(position_x: 41, position_y: 68, kind: 'green')
      @other_cab_2 = Cab.create(position_x: 42, position_y: 69, kind: 'green')
      @closest_cab = Cab.create(position_x: 43, position_y: 70, kind: 'green')
      @other_cab_3 = Cab.create(position_x: 44, position_y: 71, kind: 'green')
      @other_cab_4 = Cab.create(position_x: 45, position_y: 72, kind: 'green')
      @journey = customer.get_a_cab_at(x: 43, y: 70, kind: 'green')
    end

    context 'when requestd for a cab with kind green' do
      it 'should return a journey assigned with nearest possible cab only' do
        expect(assigned_cab = @journey.cab).not_to eq(@other_cab_1)
        expect(assigned_cab).not_to eq(@other_cab_2)
        expect(assigned_cab).to eq(@closest_cab)
        expect(assigned_cab).not_to eq(@other_cab_3)
        expect(assigned_cab).not_to eq(@other_cab_3)
      end
    end

  end

end
