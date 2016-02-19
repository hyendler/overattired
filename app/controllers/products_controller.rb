class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    # returns @product
  end

  def new
    # returns @product
  end

  def update
    if @product.update(product_params)
      @product
    else
      errs
    end
  end

  def create
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
    params.permit(:name, :gender, :url)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def errs
    errors = @badge.errors
  end
end
