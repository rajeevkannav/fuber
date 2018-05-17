class CreateCabs < ActiveRecord::Migration[5.1]
  def change
    create_table :cabs do |t|
      t.decimal :position_x
      t.decimal :position_y
      t.string :kind

      t.timestamps
    end
  end
end
