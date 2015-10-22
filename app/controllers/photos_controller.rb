class PhotosController < ApplicationController
	before_action :authenticate_user! #makes sure a user is logged in 
	def create
		@place = Place.find(params[:place_id]) #matches picture with brewery
		@place.photos.create(photo_params)
		redirect_to place_path(@place)#redirects user to show page of that specific place
	end

	private

	def photo_params
		params.require(:photo).permit(:caption, :picture)
	end
end

