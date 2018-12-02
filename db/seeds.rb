# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if MasterProductType.all.blank?
	User.create([{name: 'Muhammad'}])

	MasterProductType.create([{name: 'Food & Beverage'}, {name: 'Tobacco'}, {name: 'Entertainment'}])

	mps = MasterProductType.all 
	Product.create([
		{name: 'Lucky Stretch', master_product_type_id: mps[1].id, price: 1000},
		{name: 'Big Mac', master_product_type_id: mps[0].id, price: 1000, is_refundable: true}, 
		{name: 'Movie', master_product_type_id: mps[2].id, price: 150}
	])

	puts "Sample products created..."
end
