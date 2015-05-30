class Book < ActiveRecord::Base
# Friendly ID Slug Names
	extend FriendlyId
  	friendly_id :name, use: [:slugged, :history, :finders]
  	# New slug if name edited
  	def should_generate_new_friendly_id?
  		slug.blank? || name_changed?
	end

	belongs_to :user
	has_many :sales
	has_attached_file :image
	has_attached_file :resource

	validates_attachment_content_type :image, 
	content_type:  /^image\/(png|gif|jpeg)/,
	message: "Only images allowed"
	 
	validates_attachment_content_type :resource,
	content_type: ['application/pdf'],
	message: "Only pdfs allowed"
	 
	validates :image, attachment_presence: true
	validates :resource, attachment_presence: false

	validates_numericality_of :price,
	greater_than: 49, message: "must be at least 50 cents"
end