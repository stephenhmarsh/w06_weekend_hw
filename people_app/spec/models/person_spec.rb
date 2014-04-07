require 'spec_helper'

describe Person do

	before(:all) do
		test_person = Person.create(first_name: "Stephen", last_name: "Marsh", birthdate: "1986-08-12", drinks: 0, img_url: "none", license: true)
	end

	# Test to make sure a new Person object has an image_url, a drinks attributes, a license, a first name, a last name when it is created.

	describe 'name' do 
		it "should return a user's full name" do 
		end
end