class Journey < ApplicationRecord

  #### Concerns ########################
  include DisplacementCalculator

  #### Constants #######################
  TIME_COST = 1 # dogecoin
  DISPLACEMENT_COST = 2 # dogecoin
  KIND_COST = 5 # dogecoin

  #### Associations ####################
  belongs_to :cab, inverse_of: :journeys
  belongs_to :customer

  #### Validations #####################
  validates :start_point_x, presence: true
  validates :start_point_y, presence: true
  validates :starts_at, presence: true

  #### Callbacks #######################
  after_update :relocate_cab

  # 1. Complete a journey, set cab free.
  # 2. Calculate price and stuff.
  def complete!(point_x:, point_y:, ends_at: Time.now)
    update(end_point_x: point_x, end_point_y: point_y, ends_at: ends_at)
  end

  def billing_amount
    (cost_per_km + cost_per_minute + cost_per_preference)
  end

  def cost_per_km
    displacement(end_point_x, start_point_x, end_point_y, start_point_y) * TIME_COST if accountable?
  end

  def cost_per_minute
    duration * DISPLACEMENT_COST if accountable?
  end

  def duration
    ((ends_at - starts_at) * 24 * 60).to_i if accountable?
  end

  def cost_per_preference
    cab.kind_of_pink? ? KIND_COST : 0 if accountable?
  end

  def accountable?
    not ends_at.nil?
  end

  private

  def relocate_cab
    cab.update(position_x: end_point_x, position_y: end_point_y)
  end

end
