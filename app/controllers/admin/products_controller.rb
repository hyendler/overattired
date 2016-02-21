class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!

  def index
  	@products = Product.all
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end





end