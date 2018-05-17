class Cab < ApplicationRecord

  #### Associations ####################
  has_many :journeys

  #### Validations #####################
  validates :position_x, presence: true
  validates :position_y, presence: true

end
