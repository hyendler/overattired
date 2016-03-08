require_dependency 'etsy.rb'

class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  before_filter :verify_admin

  def index
  	@products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
    # if @product
    #   # do your normal thing
    # else
    #   errs
    #   # render somewhere?
    # end
  end

  def create
    @product = Product.new(product_params)
    @product.active = true;
    if @product.save
      redirect_to admin_products_path
    else
      errs
      render 'new'
    end
  end

  def show
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product.id)
    else
      errs
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  # also remove any sold products
  def update_products_from_etsy
    store_data_from_etsy
    redirect_to admin_products_path
  end

private
  def product_params
    params.require(:product).permit(:title, :subtitle, :category, :when_made, :image_url, :size, :url, measurement_attributes: [:id, :gender, :hips, :waist, :chest, :inseam, :bust])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def errs
    errors = @product.errors
  end
end
