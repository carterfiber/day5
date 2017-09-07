# Employee Class - all employee profiles (instances must match this data structure)

class Employee
	attr_accessor :name, :role, :location
	attr_reader :employee_number

	def initialize(name,role,location,employee_number) #must always init to activiate the variables
		@name = name
		@role = role
		@location = location
		@employee_number = employee_number		
	end

	def update_name(name)
		@name = name
		puts "The employee name has been updated to #{name}."
	end

	def update_role(role)
		@role = role
		puts "The employee role has been updated to #{role}."
	end

	def update_location(location)
		@location = location
		puts "The employee location has been updated to #{location}."
	end

	def transfer_location(location)
		#figure this out later
		
	end
end

# --------------- main menu method ----------- /

def main_menu
	puts "\n"
	puts "Welcome to the Employee Record Manager"
	puts "Please make a selection to proceed"
	puts "\n"

	puts "1. Create a new employee record"
	puts "2. View or modify records"
	puts "3. Exit program"

	print "Option: "
	option = gets.chomp.to_i
	
	case option
	when 1
		create_new_record
		main_menu
	when 2
		view_or_modify_records
	when 3
		puts "Thank you. Goodbye."
		puts "\n"
	else
		puts "Invalid Entry. Please choose from the available options."
		main_menu
	end
end

# -------------- create new record method ----------- /

def create_new_record
	
	new_array = Array.new
	puts "How many records do you want to add?"

	num = gets.chomp.to_i
	count = 1
	num.times do 

		puts "Please enter employee #{count} name: "
		name = gets.chomp.upcase
		first_name = name.split(' ', 2)
		puts "Please enter #{first_name[0].downcase.capitalize}'s role"
		role = gets.chomp.upcase
		puts "Please enter #{first_name[0].downcase.capitalize}'s office location"
		location = gets.chomp.upcase
		employee_num = "101-#{@employees.length}-#{location.slice(0..2)}"
		new_employee = Employee.new(name,role,location,employee_num)
		@employees.push(new_employee)
		count += 1
	

		@employees.each do |c| 
			if c.name == name and c.role == role and c.location == location and c.employee_number == employee_num
				puts "-------------------------------------"
				puts "\n"
				puts "New employee record has been created."
				puts "Name: #{name}" #thought this should have been just #name from the employees array
				puts "Role: #{role}"
				puts "Location: #{location}"
				puts "Employee Number: #{employee_num}" #thought this should have been #employee_number from the employees array
				puts "\n"
				puts "-------------------------------------"
			# employ = Array.new(name,role)
			
			end

		end

	end
end


# -------------- view_or_modify records method ----------- /

def view_or_modify_records
	puts "\n"
	puts "-------------------------------------"
	puts "Welcome to the records review page."
	puts "Select from the options below.\n"

	puts "1. View all employee records"
	puts "2. Modify records"
	puts "3. Return to main menu"

	print "Choice: "
	choice = gets.chomp.to_i

	case choice
	when 1
		view_all_records
		view_or_modify_records
	when 2
		modify_records
		view_or_modify_records
	when 3
		main_menu
	else
		puts "Invalid Entry. Please choose from the available options."
		view_or_modify_records(name,role,location,employee_num)
	end
end


# -------------view all records method -------------/
def view_all_records
	puts " '#'     Name "
	puts "------------------------"
	@employees.each_with_index do |a,i| 
	puts "  #{i}  -   #{a.name} - #{a.role} - #{a.location} #{a.employee_number}"	
	end
	# view_or_modify_records
end


# -------------modify records method -------------/
def modify_records
	@employees.each_with_index do |a,i| 
	puts " '#'     Name "
	puts "------------------------"
	puts "  #{i}  -   #{a.name} - #{a.role} - #{a.location} #{a.employee_number}"		
	end
	# view_all_records

	puts "Which record number do you want to modify?"
	print "Enter record number: "
	input1 = gets.chomp.to_i
	puts "-------------------------------------"
	
	name = ""
	puts "\n"
	puts "Which specific item do you want to change?"
	puts "Select from the following options: "
	puts "1. Name"
	puts "2. Role"
	puts "3. Location"
	choice1 = gets.chomp.to_i



	# @employees.each_with_index do |a,i| 
	# puts " '#'     Name "
	# puts "------------------------"
	# puts "  #{i}  -   #{a.name} - #{a.role} - #{a.location} #{a.employee_number}"		
	# end

	case choice1
	when 1
		puts "What is the new name?"
		name1 = gets.chomp.downcase.capitalize

		puts "-------------------------------------"

			@employees.each_with_index do |a,i|
				if input1 == i
					a.update_name(name1)
					# puts "account has been updated" #don't need because message is in the def above
				end
			end	
	when 2
		puts "What is the new role?"
		role1 = gets.chomp.downcase.capitalize

		puts "-------------------------------------"

			@employees.each_with_index do |a,i|
				if input1 == i
					a.update_role(role1)
				end
			end	


	when 3
		puts "What is the new lcoation?"
		location1 = gets.chomp.downcase.capitalize

		puts "-------------------------------------"

			@employees.each_with_index do |a,i|
				if input1 == i
					a.update_location(location1)
				end
			end		
	else
		puts "Invalid choice. Try again."
	end
end


# ----------------- main program ----------- /

@employees = Array.new #instance variable - the array storing all of the employee records

main_menu








