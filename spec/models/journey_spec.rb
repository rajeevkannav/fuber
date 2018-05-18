require 'rails_helper'

RSpec.describe Journey, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context "associations" do
    it {should belong_to(:cab)}
    it {should belong_to(:customer)}
  end

  context "Validations" do
    it {should validate_presence_of :start_point_x}
    it {should validate_presence_of :start_point_y}
    it {should validate_presence_of :starts_at}

    it {should validate_presence_of(:end_point_x).on(:update)}
    it {should validate_presence_of(:end_point_y).on(:update)}
    it {should validate_presence_of(:ends_at).on(:update)}

  end

end
