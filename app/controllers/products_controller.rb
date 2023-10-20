class ProductsController < ApplicationController
  before_action :set_customer, only: [:index, :create]
  
  def index
    if @customer
      @products = @customer.products
    else
      @products = nil
    end
  end
  def new
    @product = Product.new()
  end

  def show
    @product
  end

  def create
    params[:products].each do |param|
      @product = @customer.products.new(product_params(param))

      if @product.save
        flash[:notice] = "Product #{@product.product} successfully created."
      else
        flash[:error] = "Something went wrong by inserting #{@product.product}, this and the rest of products won't be created, please try again."
        render :new, status: :unprocesable_entity
      end
    end

    redirect_to products_path(customer: @customer.id), status: :created
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_customer
    if params[:customer]
      @customer = Customer.find(params[:customer])
    else
      flash[:notice] = "The route you are tying to access doesn't exist. Did you mean /products?customer={some_valid_id}?"
    end
  end

  def product_params(param)
    param.permit(:quantity, :product, :unit_price, :amount)
  end
end
