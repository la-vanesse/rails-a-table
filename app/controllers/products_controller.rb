class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def sets
    @products = Product.sets
    render :index
  end

  def plates
    @products = Product.plates
    render :index
  end

  def cutleries
    @products = Product.cutleries
    render :index
  end

  def glasses
    @products = Product.glasses
    render :index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
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
    params.require(:product).permit(:name, :description, :price, :quantity, :event_type, :product_type)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
