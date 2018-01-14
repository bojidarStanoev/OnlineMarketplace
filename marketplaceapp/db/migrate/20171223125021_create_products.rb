class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.belongs_to :subcategory, index: true
      t.belongs_to :brand, index: true
      t.string :name
      t.text :description
      t.binary :image, :limit => 10.megabyte
      t.float :price

      t.timestamps
    end
  end
end
