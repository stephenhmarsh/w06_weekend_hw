class Person < ActiveRecord::Base

	validates(:img_url, :drinks, :license, :first_name, :last_name, presence: true)

	def name
		return "#{self.first_name} #{self.last_name}"
	end

end