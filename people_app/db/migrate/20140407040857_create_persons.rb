class CreatePersons < ActiveRecord::Migration
  def change
    create_table :people do |t|
    	t.string "first_name"
    	t.string "last_name"
    	t.date "birthdate"
    	t.integer "drinks"
    	t.string "img_url"
    	t.boolean "license"
    end
  end
end
