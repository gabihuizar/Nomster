class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]
	def index
		@places = Place.paginate(:page => params[:page], :per_page => 5)

	end

	def new #presents the form
		@place = Place.new
	end

	def create #when the button is pressed
		current_user.places.create(place_params)
		redirect_to root_path
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update#will get executed when the user presses the button on the edit form
		@place = Place.find(params[:id]) #will find the data
		@place.update_attributes(place_params) #this will update each of our database's values
		redirect_to root_path #redirects user to root page
	end
	
	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end

end
