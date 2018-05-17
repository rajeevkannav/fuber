class Customer < ApplicationRecord

  #### Concerns ########################
  include DisplacementCalculator

  #### Associations ####################
  has_many :journeys

  #### Callbacks #######################
  has_secure_token

  # 1. From the list of available cab's look in for the one which is at the nearest (by pythagoras theorem approach of distance calculation)
  # 2. If found one, then create a journey with it and return else return nil
  def book_a_cab_at(x:, y:, kind: nil)
    cab, duration = Cab.available.where(kind: kind).map do |cab|
      [cab, distance(cab.position_x, x, cab.position_y, y)]
    end.sort {|dist_x, dist_y| dist_x[1] <=> dist_y[1]}.first

    cab.journeys.create(customer: self, start_point_x: x, start_point_y: y, starts_at: Time.now) if cab # pessimistic lock
  end

end
