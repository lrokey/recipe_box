class Category < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]

	has_many :taggings
  	has_many :recipes, through: :taggings

  	def to_s
  		name
  	end

  	def should_generate_new_friendly_id?
		slug.blank? || name_changed?
	end
end
