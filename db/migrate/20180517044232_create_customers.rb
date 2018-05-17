class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :token
      t.timestamps
    end

    add_index :customers, :token, unique: true
  end
end
