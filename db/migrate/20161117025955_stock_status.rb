class StockStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :in_stock?, :string
  end
end
