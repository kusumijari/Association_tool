# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


drinks = ["Coke", "Diet-Coke", "Pepsi", "Diet-Pepsi", "Sprite", "Diet-Sprite", "Vernors", "Diet-Vernors"]
drinks.each do |drink|
	Drink.create(name: drink)
end

association_types = ["Very Related", "Somewhat Related", "Not Related"]
association_types.each do |association_type|
	AssociationType.create(name: association_type)
end
