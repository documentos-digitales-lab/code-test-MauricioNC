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
    @products_hash = []

    params[:products].each do |param|
      @product = @customer.products.new(product_params(param))

      @products_hash.push(@product)

      if @product.save
        flash[:notice] = "Product #{@product.product} successfully created."
      else
        flash[:error] = "Something went wrong by inserting #{@product.product}, this and the rest of products won't be created, please try again."
        render :new, status: :unprocessable_entity
      end
    end

    CreateInvoiceJob.perform_later(@customer.id, @roducts_hash)

    @invoice = Invoice.last

    respond_to do |format|
      format.html { redirect_to customers_path(@customer.id), notice: "Product was successfully created." }
      format.turbo_stream
    end
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
