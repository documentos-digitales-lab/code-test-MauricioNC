class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.integer :amount
      t.integer :sub_total
      t.integer :tax
      t.integer :total
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
