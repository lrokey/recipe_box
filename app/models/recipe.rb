class Recipe < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: [:slugged, :history]

	belongs_to :user
	has_many :ingredients
	has_many :directions

	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

	validates :title, :description, :image, presence: true
	
	has_attached_file :image, :styles => { :medium => "400x400#" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	def should_generate_new_friendly_id?
		slug.blank? || title_changed?
	end


end
