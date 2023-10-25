class ChangeSubTotalToAmountFromProductsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :sub_total, :amount
  end
end
