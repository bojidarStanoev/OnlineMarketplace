class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.text :adress
      t.text :products

      t.timestamps
    end
  end
end
