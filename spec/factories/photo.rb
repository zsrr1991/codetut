FactoryGirl.define do
	factory :photo do
		title {Faker:: Lorem.word }
		title {Faker:: Lorem.sentence }
	
	    factory :photo_with_file do
			image { File.open("#{Rails.root}/spec/support/tractor.jpg") }
		end
	end
end