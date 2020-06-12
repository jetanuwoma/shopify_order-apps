class CreateNarwhalOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :narwhal_orders do |t|
      t.string :order_id
      t.string :customer
      t.string :order_name
      t.references :shop, null: false, foreign_key: true, index: true

      t.timestamps
    end

    add_index :narwhal_orders, :order_id, unique: true
  end
end
