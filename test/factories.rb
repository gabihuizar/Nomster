FactoryGirl.define do 
	factory :place do
		name "Yum Yum Beer"
		description "great beer"
		address "200 brew blvd, san diego, ca 92069"
		association :user
	end

	factory :comment do
		message "wow i love this beer so much"
		rating "5_stars"
		association :user
		association :place
	end

	factory :user do
		sequence (:email) {|n| "test#{n}@gmail.com" }


		password "testpassword1"
		password_confirmation "testpassword1"
	end
end
