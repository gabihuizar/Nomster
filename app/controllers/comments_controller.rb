class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@place = Place.find(params[:place_id])#gets the corresponding place
		@place.comments.create(comment_params.merge(:user => current_user)) #we are able to call @place.comments.create because a place has_many comments
		redirect_to place_path(@place)#redirects user to show page of that specific place
	end

	private

	def comment_params
		params.require(:comment).permit(:message, :rating)
	end
end
