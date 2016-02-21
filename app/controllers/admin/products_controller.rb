class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
  	@products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])

  	# if @product == nil
  	# 	err
  	# end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      errs
      render 'edit'
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

private

  def product_params
    params.require(:product).permit(:name, :url)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def errs
    errors = @product.errors
  end


end