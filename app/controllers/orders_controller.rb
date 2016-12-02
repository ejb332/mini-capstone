class OrdersController < ApplicationController
  def create
    # order = Order.new(
    #   order.quantity = params["quantity"],
    #   order.user_id = current_user.id,
    #   order.product_id = params["product_id"],
    #   product = Product.find_by(id: order.product_id),
    #   order.subtotal = order.quantity * product.price,
    #   order.tax = order.quantity * product.tax,
    #   order.total = order.subtotal + order.tax
    # )
    # order.save
    # redirect_to "/orders/#{order.id}"

    @carted_products = current_user.carted_products.where(status: "carted")
    subtotal = 0
    @carted_products.each do |carted_product|
      subtotal += carted_product.quantity * carted_product.product.price
    end
    tax = subtotal * 0.09
    total = subtotal + tax

    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
      )
    order.save

    carted_products.update_all(status: "purchased", order_id: order.id)
    flash[:success] = "Your order was created successfully!"
    redirect_to "/orders/#{order.id}"
  end

  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    render "show.html.erb"
  end
end