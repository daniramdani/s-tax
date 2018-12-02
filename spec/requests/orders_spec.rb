require 'rails_helper'

RSpec.describe 'orders API', type: :request do

  # Test suite for POST /orders
  describe 'POST /orders' do
    before { 
      @user = create(:user)
      @master_product_type = create(:master_product_type)
      @product = create(:product, master_product_type_id: @master_product_type.id)
      @valid_attributes = { user_id: @user.id, product_id: @product.id, tax_code: 1 } 

      post "/orders", params: @valid_attributes
    }

    it 'returns orders' do
      expect(json).not_to be_empty
      expect(json.size).to eq(6)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(201)
    end
  end

  # Test suite for GET /orders
  describe 'GET /orders' do
    before { 
      @user = create(:user)
      @master_product_type = create(:master_product_type)
      @product = create(:product, master_product_type_id: @master_product_type.id)
      @order = create(:order, user_id: @user.id, product_id: @product.id, tax_code: 1)

      get "/orders/gets/#{@user.id}"
    }

    it 'returns orders' do
      expect(json).not_to be_empty
      expect(json["items"].size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


end