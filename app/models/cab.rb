class Cab < ApplicationRecord

  #### Concerns ########################
  include DisplacementCalculator

  #### Associations ####################
  has_many :journeys, inverse_of: :cab

  #### Validations #####################
  validates :position_x, presence: true
  validates :position_y, presence: true

  scope :available, -> {includes(:journeys).where('journeys.id' => nil).or(includes(:journeys).where.not('journeys.ends_at' => nil))}

  def kind_of_pink?
    (kind == 'pink')
  end

  def self.find_cab_for(x:, y:, kind: nil)
    cab, displacement = Cab.available.where(kind: kind).map do |cab|
      [cab, cab.displacement(cab.position_x, x, cab.position_y, y)]
    end.sort {|dist_x, dist_y| dist_x[1] <=> dist_y[1]}.first
    cab
  end

end
