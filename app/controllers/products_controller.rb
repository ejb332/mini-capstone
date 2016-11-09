class ProductsController < ApplicationController
  def products_method
    @product = products.first
    render 'products.html.erb'
  end
end
