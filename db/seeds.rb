# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


drink_list = ["Coke", "Diet Coke", "Pepsi", "Diet Pepsi", "Sprite", "Diet Sprite", "Vernors", "Diet Vernors"]
drink_list.each do |drink|
	Drink.create(name: drink)
end

association_type_list = ["Very Related", "Somewhat Related", "Not Related"]
association_type_list.each do |association_type|
	AssociationType.create(name: association_type)
end

# Drink.create(name: 'Coke')
# Drink.create(name: "Diet Coke")
# Drink.create(name: "Pepsi")
# Drink.create(name: "Diet Pepsi")
# Drink.create(name: "Sprite")
# Drink.create(name: "Diet Sprite")
# Drink.create(name: "Vernors")
# Drink.create(name: "Diet Vernors")

