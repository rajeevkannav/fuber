class Cab < ApplicationRecord

  #### Associations ####################
  has_many :journeys, inverse_of: :cab, dependent: :destroy

  #### Validations #####################
  validates :position_x, presence: true
  validates :position_y, presence: true

  scope :available, -> {includes(:journeys).where('journeys.id' => nil).or(includes(:journeys).where.not('journeys.ends_at' => nil))}

  def kind_of_pink?
    (self.kind == 'pink')
  end

end
