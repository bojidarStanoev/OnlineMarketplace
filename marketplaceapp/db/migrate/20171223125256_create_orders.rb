class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :adress
      t.text :products

      t.timestamps
    end
  end
end
