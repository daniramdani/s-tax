class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :master_product_type_id, foreign_key: true
      t.boolean :is_refundable, default:false
      t.float :price

      t.timestamps
    end

    add_index :products, :master_product_type_id
  end
end
