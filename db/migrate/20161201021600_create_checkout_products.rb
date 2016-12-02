class CreateCheckoutProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :checkout_products do |t|
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
