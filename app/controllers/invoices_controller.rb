class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:index, :show]
  before_action :set_customer, only: [:index, :show]

  def index
    @invoices = @customer.invoices
  end

  def show
    @invoice
    @products = @invoice.products
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def set_customer
    @customer = Customer.find(@invoice.customer_id)
  end
end
