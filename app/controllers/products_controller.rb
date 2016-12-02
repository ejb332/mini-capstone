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
    elsif params[:category_name] != nil
      selected_category = Category.find_by(name: params[:category_name])
      @products = selected_category.products
    end
    render "index.html.erb"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end

  def new
    if current_user && current_user.admin
      render "new.html.erb"
    else
      redirect_to "/products"
    end
  end

  def create
    if current_user && current_user.admin
      cheese = Product.new(
        name: params["name"],
        price: params["price"],
        image: params["image"],
        description: params["description"]
        )
      cheese.save
      flash[:success] = "Product added successfully!"
      redirect_to "/checkout"
    else
      redirect_to "/login"
    end
  end

  def edit
    if current_user
      product_id = params[:id]
      @product = Product.find_by(id: product_id)
      render "edit.html.erb"
    else
      redirect_to "/products"
    end
  end

  def update
    if current_user && current_user.admin
      product_id = params[:id]
      product = Product.find_by(id: product_id)
      product.name = params[:name]
      product.price = params[:price]
      product.image = params[:image]
      product.description = params[:description]
      product.save
      flash[:success] = "Product update complete!"
      redirect_to "/products/#{product.id}"
    else
      redirect_to "/login"
    end
  end

  def destroy
    if current_user && current_user.admin
      product_id = params[:id]
      product = Product.find_by(id: product_id)
      product.destroy
      flash[:success] = "Goodbye, out-of-date product"
      redirect_to "/products"
    else
      redirect_to "/login"
    end
  end
end