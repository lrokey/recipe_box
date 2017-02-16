class Recipe < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: [:slugged, :history]

	belongs_to :user
	has_many :reviews
	has_many :ingredients
	has_many :directions
	has_many :taggings
	has_many :reviews
	has_many :categories, through: :taggings

	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

	validates :title, :description, :image, presence: true
	
	has_attached_file :image, :styles => { :medium => "400x400#" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	def should_generate_new_friendly_id?
		slug.blank? || title_changed?
	end

	def category_list
		categories.join(", ")
	end

	def category_list=(categories_string)
		category_names = categories_string.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name)}
		self.categories = new_or_found_categories
	end

	def review_criteria_list
		categories.join(", ")
	end

	def review_criteria_list=(categories_string)
		category_names = categories_string.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name)}
		self.categories = new_or_found_categories
	end
end
