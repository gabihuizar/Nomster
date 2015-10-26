class UsersController < ApplicationController

	def show
		@user = User.find(params[:id]) #takes id from url, looks the user up
		# then puts that user in the @user value which we can use inside the view
	end
end
