class Journey < ApplicationRecord

  #### Concerns ########################
  include DisplacementCalculator

  #### Constants #######################
  TIME_COST = 1.0 # dogecoin
  DISPLACEMENT_COST = 2.0 # dogecoin
  KIND_COST = 5.0 # dogecoin

  #### Associations ####################
  belongs_to :cab, inverse_of: :journeys
  belongs_to :customer, inverse_of: :journeys

  #### Validations #####################
  validates :start_point_x, presence: true
  validates :start_point_y, presence: true
  validates :starts_at, presence: true

  validates :end_point_x, presence: true, on: :update
  validates :end_point_y, presence: true, on: :update
  validates :ends_at, presence: true, on: :update

  #### Callbacks #######################
  after_update :reposition_cab

  # 1. Complete a journey, set cab free.
  # 2. Calculate price and stuff.
  def complete!(x:, y:, ends_at: Time.now)
    update(end_point_x: x, end_point_y: y, ends_at: ends_at)
  end

  def cost
    cost_per_km + cost_per_minute + cost_per_preference
  end

  def cost_per_km
    completed? ? (displacement(end_point_x, start_point_x, end_point_y, start_point_y) * DISPLACEMENT_COST) : 0.0
  end

  def cost_per_minute
    completed? ? (duration * TIME_COST) : 0.0
  end

  def cost_per_preference
    completed? ? (cab.kind_of_pink? ? KIND_COST : 0.0) : 0.0
  end

  def duration
    completed? ? ((ends_at - starts_at) / 1.minute).round : 0.0
  end

  def completed?
    not ends_at.nil?
  end

  private

  def reposition_cab
    cab.update(position_x: end_point_x, position_y: end_point_y)
  end

end
