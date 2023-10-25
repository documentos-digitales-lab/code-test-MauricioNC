class RemoveAmountColumnFromInvoices < ActiveRecord::Migration[7.0]
  def change
    remove_column :invoices, :amount
  end
end
