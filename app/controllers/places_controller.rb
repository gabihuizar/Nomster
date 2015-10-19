class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update] #allows only logged in user to create new, and edit a brewery
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

		if @place.user != current_user #this will only be triggered if user logged in is not user that created place
			return render :text => "Not Allowed", :status => :forbidden
		end
	end

	def update#will get executed when the user presses the button on the edit form
		@place = Place.find(params[:id]) #will find the data
		if @place.user != current_user
			return render :text => "Not Allowed", :status => :forbidden
		end
		@place.update_attributes(place_params) #this will update each of our database's values
		redirect_to root_path #redirects user to root page
	end

	def destroy
		@place = Place.find(params[:id])#finds the place
		@place.destroy #destroys it
		redirect_to root_path #redirects user to root page

	end

	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end

end
