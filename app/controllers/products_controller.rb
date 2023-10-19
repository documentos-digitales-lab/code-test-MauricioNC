class ProductsController < ApplicationController
  before_action :set_customer, only: [:create]
  
  def index
    @products = Product.all
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
        render :new
      end
    end

    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_customer
    @customer = Customer.find(params[:customer])
  end

  def product_params(param)
    param.permit(:quantity, :product, :unit_price, :sub_total)
  end
end
