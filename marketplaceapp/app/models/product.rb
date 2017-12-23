class Product < ApplicationRecord
  has_one :subcategory
  has_one :brand
end
