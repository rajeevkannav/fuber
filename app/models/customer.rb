class Customer < ApplicationRecord

  #### Associations ####################
  has_many :journeys

  #### Validations #####################
  validates :token, presence: true, uniqueness: true

end
