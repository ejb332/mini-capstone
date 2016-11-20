class DescriptionDataNameFix < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :text, :description
    change_column :products, :description, :text
  end
end
