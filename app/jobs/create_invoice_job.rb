class CreateInvoiceJob < ApplicationJob
  queue_as :default

  def perform(customer_id, products)
    customer = Customer.find(customer_id)
    
    products = Product.find(products.pluck(:id))

    sub_total = Product.where(id: products.pluck(:id)).sum(:amount)
    tax = sub_total * 0.16
    total = tax + sub_total

    invoice = customer.invoices.create(sub_total: sub_total, tax: tax, total: total)
    invoice.products << products
  end
end
