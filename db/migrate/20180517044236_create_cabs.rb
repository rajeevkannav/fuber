class CreateCabs < ActiveRecord::Migration[5.1]
  def change
    create_table :cabs do |t|
      t.float :position_x
      t.float :position_y
      t.string :kind

      t.timestamps
    end
  end
end
