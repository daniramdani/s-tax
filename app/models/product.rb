class Product < ApplicationRecord
	has_many :orders
	belongs_to :master_product_type
end
