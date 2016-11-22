class SuppliersController < ApplicationController
  def index
    render "index.html.erb"
  end

  def new
    supplier = Supplier.new(
      name: params["name"],
      email: params["email"],
      phone: params["phone"]
      )
    supplier.save
    flash[:success] = "Supplier added successfully!"
    redirect to "/suppliers"
  end

  def show
    supplier_id = params[:id]
    @supplier = Supplier.find_by(id: supplier_id)
    render "show.html.erb"
  end

  def edit
    supplier_id = params[:id]
    @supplier = Supplier.find_by(id: supplier_id)
    render "edit.html.erb"
  end

  def update
    # these will probably eventually be instance variables - as we'll want to
    # redirect people to view the changes. Right now we're just blindly redirecting
    # without checking for certain parameters to be met (i.e. there must be something
    # in the name input). General rule: use instance variables (@supplier) whenever
    # we need to display something
    supplier_id = params[:id]
    supplier = Supplier.find_by(id: supplier_id)
    supplier.name = params[:name]
    supplier.email = params[:email]
    supplier.phone = params[:phone]
    supplier.save
    flash[:success] = "Supplier update complete. Thanks!"
    redirect_to "/suppliers/#{supplier.id}"
  end

  def destroy
    supplier_id = params[:id]
    supplier = Supplier.find_by(id: supplier_id)
    supplier.destroy
    flash[:success] = "We no longer do business together. Goodbye!"
    redirect_to "/suppliers"
  end
end