class ProductsController < ApplicationController
  def index
    sort = params[:sort]
    @products = Product.all.order(sort)
    if sort == "sort_desc"
      @products = Product.order(price: :desc)
    elsif sort == "discount"
      @products = Product.where("price < ?", 10)
    elsif sort == "random"
      @products = Product.all.sample(1)
    elsif sort == "search_sort"
      @products = Product.order(:name)
    end
    render "index.html.erb"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    cheese = Product.new(
      name: params["name"],
      price: params["price"],
      image: params["image"],
      description: params["description"]
      )
    cheese.save
    flash[:success] = "Product added successfully!"
    redirect_to "/products"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end

  def update
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.name = params[:name]
    product.price = params[:price]
    product.image = params[:image]
    product.description = params[:description]
    product.save
    flash[:success] = "Product update complete!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
    flash[:success] = "Goodbye, out-of-date product"
    redirect_to "/products"
  end
end