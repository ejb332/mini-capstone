class RemoveImageId < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :image_id, :string
  end
end
