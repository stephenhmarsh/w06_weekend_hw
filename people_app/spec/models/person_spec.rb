require 'spec_helper'

describe Person do

	before(:each) do
		@test_person = Person.create(first_name: "Stephen", last_name: "Marsh", birthdate: "1986-08-12", drinks: 0, img_url: "none", license: true)
		@test_minor = Person.create(first_name: "Bob", last_name: "Bobson", birthdate: "2012-08-12", drinks: 0, img_url: "none", license: true)
		@test_no_license = Person.create(first_name: "Bob", last_name: "Bobson", birthdate: "1986-08-12", drinks: 0, img_url: "none", license: false)
		@test_eighteen_old = Person.create(first_name: "Bob", last_name: "Bobson", birthdate: "1996-01-01", drinks: 0, img_url: "none", license: true)

	end

	# Test to make sure a new Person object has an image_url, a drinks attributes, a license, a first name, a last name when it is created.
	it{should validate_presence_of(:img_url)}
	it{should validate_presence_of(:drinks)}
	it{should validate_presence_of(:license)}
	it{should validate_presence_of(:first_name)}
	it{should validate_presence_of(:last_name)}

# #name
# should return a string that is the object's full name

	describe '#name' do 
		it "should return a user's full name" do 
			expect(@test_person.name).to eq("Stephen Marsh")
		end
	end

# #birthday
# should return a string that is the object's birthday

	describe '#birthday' do
		it "should return a string that is the object's birthday" do
			expect(@test_person.birthday).to eq("1986-08-12")
		end
	end

#have_a_drink
# if they are over 21 then they can drink and the number stored in the drinks attribute is increased by 1
# if they are under 21 then the string "Wait a few years" is returned
# if they can drink, they are not allowed to have more than three drinks otherwise the string "Go home you're drunk"

describe '#have_a_drink' do
		it "if they are over 21 then they can drink and the number stored in the drinks attribute is increased by 1" do
			@test_minor.have_a_drink
			@test_person.have_a_drink
			expect(@test_minor.drinks).to eq(0)
			expect(@test_person.drinks).to eq(1)
		end
		it "if they are under 21 then the string 'Wait a few years' is returned" do
			expect(@test_minor.have_a_drink).to eq("Wait a few years")
		end
		it "If they can drink, they are not allowed to have more than three drinks otherwise the string 'Go home you're drunk'" do
			@test_person.have_a_drink #1
			@test_person.have_a_drink #2
			@test_person.have_a_drink #3
			expect(@test_person.drinks).to eq(3)
			expect(@test_person.have_a_drink).to eq("Go home you're drunk")
		end
	end

#drive_a_car
# if they are under 18 then a string "Not yet youngin" is returned
# if they are 18 and they have a license then they can drive
# if they are over 18 and have a license then they can drive
# if they are over 21, have a license, and are drunk then the string "Looks like a cab for you tonight" is returned

describe "#drive_a_car" do
	it "If they are under 18 then a string 'Not yet youngin' is returned" do
		expect(@test_minor.drive_a_car).to eq("Not yet youngin")
	end
	it "If they are 18 and they have a license then they can drive" do
		expect(@test_eighteen_old.drive_a_car).to eq("Vroom.")
	end
	it "If they are over 18 and have a license then they can drive" do
		expect(@test_person.drive_a_car).to eq("Vroom.")
		expect(@test_no_license.drive_a_car).to eq("Sorry, no license, bro.")
	end
	it "# if they are over 21, have a license, and are drunk then the string 'Looks like a cab for you tonight' is returned" do
		expect(@test_person.drive_a_car).to eq("Vroom.")
		@test_person.drinks = 3
		expect(@test_person.drive_a_car).to eq("Looks like a cab for you tonight")
	end
		
end


end