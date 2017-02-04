class Category < ApplicationRecord
	has_many :taggings
  	has_many :recipes, through: :taggings

  	def to_s
  		name
  	end
end
