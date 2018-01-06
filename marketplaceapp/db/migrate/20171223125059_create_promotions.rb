class CreatePromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :promotions do |t|
      t.belongs_to :product, index: true
      t.string :name
      t.float :newprice

      t.timestamps
    end
  end
end
