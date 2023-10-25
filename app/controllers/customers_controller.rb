require 'json'

class CustomersController < ApplicationController
  before_action :set_random_customer, only: [:show]
  include CustomersHelper


  def new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.create(rfc: 'AAA')
    redirect_to customer_path(@customer)
  end

  def update
    Customer.find(params[:id])
    redirect_to new_customer_path
  end

  private

  def set_random_customer
    @customer_credentials = JSON.parse(get_user(params[:id]))
  end
end
