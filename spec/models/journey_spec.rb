require 'rails_helper'

RSpec.describe Journey, type: :model do

  context 'associations' do
    it {should belong_to(:cab)}
    it {should belong_to(:customer)}
  end

  context 'Validations' do
    it {should validate_presence_of :start_point_x}
    it {should validate_presence_of :start_point_y}
    it {should validate_presence_of :starts_at}

    it {should validate_presence_of(:end_point_x).on(:update)}
    it {should validate_presence_of(:end_point_y).on(:update)}
    it {should validate_presence_of(:ends_at).on(:update)}
  end

  describe 'Update an Journey' do

    before(:each) do
      customer = Customer.create(name: 'Sample Customer')
      Cab.create(position_x: 47, position_y: 68, kind: 'green')
      @journey = customer.get_a_cab_at(x: 45, y: 67, kind: 'green')
    end

    context 'without end_point_x' do
      it 'should return nil' do
        completed = @journey.complete!(x: nil, y: 89, ends_at: Time.now+5.minutes)
        expect(false).to eq(completed)
      end
    end

    context 'without end_point_x' do
      it 'should return nil' do
        completed = @journey.complete!(x: 45, y: nil, ends_at: Time.now+5.minutes)
        expect(false).to eq(completed)
      end
    end

    context 'without ends_at' do
      it 'should return nil' do
        completed = @journey.complete!(x: 45, y: 89, ends_at: nil)
        expect(false).to eq(completed)
      end
    end

    context 'with end_point_x, end_point_x ends_at' do
      it 'should return nil' do
        completed = @journey.complete!(x: 46, y: 89, ends_at: Time.now+5.minutes)
        expect(true).to eq(completed)
      end
    end
  end

end
