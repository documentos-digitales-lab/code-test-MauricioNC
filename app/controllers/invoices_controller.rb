class InvoicesController < ApplicationController
  before_action :set_customer, only: [:index, :show]
  before_action :set_invoice, only: [:show]

  def index
    @invoices = @customer.invoices
  end

  def show
    @invoice
    @products = @invoice.products
  end

  private

  def set_invoice
    @invoice = @customer.invoices.where(id: params[:id]).first
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
end
