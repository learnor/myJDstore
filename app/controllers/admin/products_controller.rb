class Admin::ProductsController < ApplicationController

  before_action :set_product, only: [:show, :create, :edit, :update, :destroy]

  def show
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    if @product.save
      redirect_to admin_products_path flash[:notice] = "Successfully created a product"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path flash[:notice] = "Successfully updated a product"
    else
      render :update
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path flash[:alert] = "Successfully deleted a product"
  end

private

  def set_product
    @product = Product.find(parasm[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end

end
