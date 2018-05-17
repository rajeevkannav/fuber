class Journey < ApplicationRecord

  #### Associations ####################
  belongs_to :cab
  belongs_to :customer

  #### Validations #####################
  validates :start_point_x, presence: true
  validates :start_point_y, presence: true
  validates :starts_at, presence: true
  validates :end_point_x, presence: true
  validates :end_point_y, presence: true
  validates :ends_at, presence: true

end
