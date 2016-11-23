class AddProductId < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :product_id, :string
  end
end
