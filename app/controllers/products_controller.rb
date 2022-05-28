class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  # create new product
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user # define owner of the product
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  # show product details
  def show; end

  # edit product details
  def edit; end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
