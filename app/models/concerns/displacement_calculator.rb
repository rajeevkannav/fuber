module DisplacementCalculator
  extend ActiveSupport::Concern

  def displacement(x1, x2, y1, y2)
    Math.sqrt(((x1 - x2)**2) + ((y1 - y2)** 2))
  end
end