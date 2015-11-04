require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
	test "comment added to db" do 
		user = FactoryGirl.create(:user)
		sign_in user

		place = FactoryGirl.create(:place)


		assert_difference "Comment.count" do
			post :create, :place_id => place.id, :comment => {
				:message => "Wow I love this beer so much",
				:rating => "5_stars"
			}

			assert_redirected_to place_path(place)

			assert_equal 1, place.comments.count
		end
	end
end
