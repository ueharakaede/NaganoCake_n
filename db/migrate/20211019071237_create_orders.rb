class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :shipping_cost
      t.integer :total_payment,null: false, default: "0"
      t.integer :payment_method,null: false, default: "0"
      t.integer :status,null: false, default: "0"

      t.timestamps
    end
  end
end
