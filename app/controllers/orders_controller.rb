class OrdersController < ApplicationController

	# POST /orders
  def create
    @order = Order.create!(order_params)
    json_response(@order, :created)
  end

  # GET /gets
  def gets
  	@orders = Order.gets params[:id]
    json_response(@orders, 200)
  end


  private

	  def order_params
	    # whitelist params
	    params.permit(:user_id, :product_id, :tax_code)
	  end
end
