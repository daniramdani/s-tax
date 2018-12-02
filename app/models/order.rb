class Order < ApplicationRecord
	belongs_to :product
	belongs_to :user
	
	validates_presence_of :product_id, :tax_code

	def self.gets user_id
		@record_orders = Order.where user_id: user_id.to_i
		get_response
		@order
	end


	private 

		def self.get_response
			items = []
			sub_total = []
			tax_sub_total = []
			grand_total = []

			@record_orders.each do |ro|
				
				order = {}

				@type_id = ro.product.master_product_type.id
				@price = ro.product.price
				@tax = get_tax
				@amount = @price + @tax

				order[:name] = ro.product.name
				order[:tax_code] = ro.tax_code
				order[:type] = ro.product.master_product_type.id
				order[:refundable] = refundable_transf @type
				order[:price] = @price
				order[:tax] = @tax
				order[:amount] = @amount
				items << order
				sub_total << @price
				tax_sub_total << @tax
				grand_total << @price
			end

			@order = {
				sub_total: sub_total.sum,
				tax_sub_total: tax_sub_total.sum,
				grand_total: grand_total.sum,
				items: items
			}

		end

		def self.refundable_transf status
			if status
				return "Yes"
			else
				return "No"
			end
		end

		def self.get_tax
			if @type_id == 1
				tax = get_tax_food_baverage
			elsif	@type_id == 2
				tax = get_tax_tobacco
			else
				tax = get_tax_entertainment
			end
		end

		def self.get_tax_food_baverage
			@price * 0.1
		end

		def self.get_tax_tobacco
			10 + (0.02 * @price)
		end

		def self.get_tax_entertainment
			if @price < 0 || @price < 100
				tax = 0
			elsif @price >= 100 
				tax = @price - 100
				tax = tax * 0.01
			else
				tax = 0
			end

			tax
		end

end
