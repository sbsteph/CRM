class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id

      t.timestamps null: false
    end
    add_foreign_key :customers, :customer_id
  end
end
