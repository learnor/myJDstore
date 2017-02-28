class Admin::ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
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
      redirect_to admin_products_path flash[:notice] = "Successfully created a product"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path flash[:notice] = "Successfully updated a product"
    else
      render :update
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path flash[:alert] = "Successfully deleted a product"
  end

private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end
end
