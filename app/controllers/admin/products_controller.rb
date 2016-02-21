class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!

  def index
  	@products = Product.all
  end

  def new
    # @product.measurement.build
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
      @product
    else
      errs
    end
  end

  def update
  end

  def destroy
  end




end