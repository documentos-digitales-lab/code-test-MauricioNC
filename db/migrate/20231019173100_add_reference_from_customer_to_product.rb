class AddReferenceFromCustomerToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :customer, null: false, foreign_key: true
  end
end
