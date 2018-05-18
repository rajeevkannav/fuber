class Customer < ApplicationRecord

  #### Associations ####################
  has_many :journeys

  #### Callbacks #######################
  has_secure_token

  scope :available, -> {includes(:journeys).where('journeys.id' => nil).or(includes(:journeys).where.not('journeys.ends_at' => nil))}
  scope :unavailable, -> {includes(:journeys).where('journeys.ends_at' => nil)}


  # 1. From the list of available cab's look in for the one which is at the nearest (by pythagoras theorem approach of distance calculation)
  # 2. If found one, then create a journey with it and return else return nil
  def get_a_cab_at(x:, y:, kind: nil)

    cab = Cab.find_cab_for(x: x, y: y, kind: kind)
    journey = nil
    Customer.transaction do
      cab.with_lock do
        journey = journeys.create(cab: cab, start_point_x: x, start_point_y: y, starts_at: Time.now)
      end
    end if cab

    journey
  end


end
