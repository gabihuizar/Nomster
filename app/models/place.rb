class Place < ActiveRecord::Base
	belongs_to :user
	validates :name, :presence => true #presents new place from being saved without a name
end
