class CreateJourneys < ActiveRecord::Migration[5.1]
  def change
    create_table :journeys do |t|

      t.belongs_to :customer
      t.belongs_to :cab

      t.decimal :start_point_x
      t.decimal :start_point_y
      t.datetime :starts_at

      t.decimal :end_point_x
      t.decimal :end_point_y
      t.datetime :ends_at

      t.timestamps
    end
  end
end
