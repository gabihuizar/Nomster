class Place < ActiveRecord::Base
	belongs_to :user
	validates :name, length: {minimum:3} , :presence => true
	validates :address, :presence => true #presents new place from being saved without a name
	validates :description, :presence => true
end
