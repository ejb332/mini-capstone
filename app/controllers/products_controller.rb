class ProductsController < ApplicationController
  def products_method
  @products = Product.all
  render 'products.html.erb'
  end

end