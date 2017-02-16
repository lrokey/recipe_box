class Drink < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: [:slugged, :history]
	
	belongs_to :user, through: :reviews
	has_many :reviews
	has_many :ingredients
	has_many :directions
	has_many :taggings
	has_many :categories, through: :taggings

	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

	validates :title, :description, :image, presence: true
	
	has_attached_file :image, :styles => { :medium => "400x400#" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
	# validates :title, :description
end
