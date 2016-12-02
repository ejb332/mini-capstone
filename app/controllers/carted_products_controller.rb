class CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render "index.html.erb"
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
end
