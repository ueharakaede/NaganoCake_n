class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :amount
      t.integer :making_status,null: false, default: "0"

      t.timestamps
    end
  end
end
