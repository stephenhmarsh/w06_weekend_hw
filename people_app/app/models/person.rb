class Person < ActiveRecord::Base

	validates(:img_url, :drinks, :license, :first_name, :last_name, presence: true)

end