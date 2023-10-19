class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :quantity
      t.string :product
      t.integer :unit_price
      t.integer :sub_total

      t.timestamps
    end
  end
end
