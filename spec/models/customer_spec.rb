require 'rails_helper'

RSpec.describe Customer, type: :model do

  context 'associations' do
    it {should have_many :journeys}
  end

  describe 'Book a cab' do
    context 'when no cab is available' do
      it 'should return nil' do
        customer = Customer.create(name: 'Sample Customer')
        journey = customer.get_a_cab_at(x: 45, y: 67, kind: 'green')
        expect(journey).to eq(nil)
      end
    end

    context 'when cab is available' do
      it 'should return a journey' do
        customer = Customer.create(name: 'Sample Customer')
        cab = Cab.create(position_x: 47, position_y: 68, kind: 'green')
        journey = customer.get_a_cab_at(x: 45, y: 67, kind: 'green')
        expect(true).to eq(journey.is_a?(Journey))
      end
    end

    context 'when all cabs are unavailable' do
      it 'should return nil' do
        customer_1 = Customer.create(name: 'Sample Customer 1')
        customer_2 = Customer.create(name: 'Sample Customer 2')

        cab = Cab.create(position_x: 47, position_y: 68, kind: 'green')

        journey = customer_1.get_a_cab_at(x: 45, y: 67, kind: 'green')

        expect(true).to eq(journey.is_a?(Journey))
        expect(true).to eq(journey.customer == Customer.first)

        journey = customer_2.get_a_cab_at(x: 45, y: 67, kind: 'green')
        expect(journey).to eq(nil)
      end
    end

    # Get Closest CAB from throrem


  end

end
