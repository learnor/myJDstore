class Admin::ProductsController < ApplicationController

  layout "admin"

  before_action :set_product, only: [:show,  :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_required

  def show
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "Successfully created a product"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Successfully updated a product"
    else
      render :update
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, alert: "Successfully deleted a product"
  end

private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end

end
