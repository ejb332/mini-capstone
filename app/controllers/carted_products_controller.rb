class CartedProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    if @carted_products.length > 0
      render "index.html.erb"
    else
      flash[:warning] = "Shopping cart empty"
      redirect_to "/products"
    end
  end

  def create
    carted_product = CartedProduct.new(
      quantity: params["quantity"],
      user_id: current_user.id,
      product_id: params["product_id"],
      status: "carted"
    )
    carted_product.save
    flash[:success] = "Product added to cart!"
    redirect_to "/products"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    # Note: we're not deleting from the database, so no .destroy. We just want to change the status so it's removed from the cart, but the record stays in the database
    carted_product.status = "removed"
    carted_product.save
    flash[:success] = "Product removed!"
    redirect_to "carted_products"
  end
end