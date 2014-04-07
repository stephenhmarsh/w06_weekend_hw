class Person < ActiveRecord::Base

	validates(:img_url, :drinks, :license, :first_name, :last_name, presence: true)

	def name
		return "#{self.first_name} #{self.last_name}"
	end

	def birthday
		return "#{self.birthdate}"
	end

	def have_a_drink
		#date math
		now = Date.today.to_time
		bday = self.birthdate.to_time
		age = now.year - bday.year
		if bday.month > now.month
			age -= 1
		elsif bday.month >= now.month && bday.day > now.day
			age -= 1
		end

		if age >= 21 
			self.drinks += 1
		else
			return "Wait a few years"
		end


	end

end