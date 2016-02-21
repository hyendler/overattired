class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # def index
  #   @products = Product.all
  # end

  def show
    # returns @product
  end

  # def new
  #   @product.measurement.build
  #   @product
  # end

  # def edit
  #   @product = Product.find(params[:id])
  # end

  def update

    if @product.update(product_params)
      redirect_to products_path
    else
      errs
      render 'edit'
    end
  end

  def create
    # might need to debug
    @product = Product.new(product_params)
    if @product.save
      @product
    else
      errs
    end
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :gender, :url, measurement_attributes: [:id, :gender, :hip, :waist, :bust, :chest, :inseam])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def errs
    errors = @product.errors
  end
end
