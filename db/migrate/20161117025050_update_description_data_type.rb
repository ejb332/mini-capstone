class UpdateDescriptionDataType < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :description, :text
  end
end
