class Drink < ApplicationRecord
	validates_uniqueness_of :name
end
