class Order < ApplicationRecord
	belongs_to :product
	validates_presence_of :product_id, :tax_code
end
