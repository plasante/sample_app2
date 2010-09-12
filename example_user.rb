class User
	# This creates "getter" and "setter" methods of instance variables
	attr_accessor :name, :email
	
	# This method is called when we execute User.new
	def initialize(attributes = {})
		@name  = attributes[:name]
		@email = attirbutes[:email]
	end
	
	def formatted_email
		"#{@name} <#{@email}"
	end
end