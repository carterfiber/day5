#Create a class for accounts

class Account
	attr_accessor :name, :balance
	attr_reader :account

	def initialize(name,account,balance)
		@name = name
		@account = account
		@balance = balance
	end

	def add_bitcoin(amount) #method to add to the account balance
		@balance += amount
		puts "Your deposit of #{amount} has been made. Your new balance is #{@balance}"
	end

	def sub_bitcoin(amount) #method to substract/withdraw from account balance
		# @balance -= amount
		if @balance < amount #if amount requested is more than available
			puts "Transaction declined. Try a different amount."
		else
			@balance -= amount
			puts "Your withdrawl of #{amount} has been made. Your new balance is #{@balance}"
		end
	end


end


#------- main menu method ----------------#
def main_menu
	puts "\n"
	puts "Welcome to NewBank.io"
	puts "Please make a selection to proceed:\n"

	puts "1. Create a new account"
	puts "2. View account details"
	puts "3. Exit program"

	print "Option: "
	option = gets.chomp.to_i

	case option

		when 1
			#create a method that can be on stored somewhere else
			create_account
			main_menu
		when 2
			#create method to login, and then view their details
			account_menu
		when 3
			puts "Thank you for joining the digital revolution. Do great things."
			puts "\n"
		else
			puts "Invalid entry! Please choose from the available options."
			main_menu
	end

end

# -------------- create account method -------------/
def create_account
	puts "Please enter a name: "
	name = gets.chomp.upcase
	print "Enter a starting balance: "
	balance = gets.chomp.to_f  #figure out a way to allow for comma inputs
	acct_num = @accounts.length + 8225
	new_account = Account.new(name,acct_num,balance)
	@accounts.push(new_account)

	@accounts.each do |a|
		if a.name == name and a.account == acct_num
			puts "Account has been created: "
			puts "Name: #{name}"
			puts "Account No.: #{acct_num}"
			puts "Balance: #{balance.round(2)}"
			puts "Please save your information for future reference."
		end
	end
end

# ----------------- account menu method ----------------/
def account_menu
	# count = 0 #this count is only within this method, and counts the number of login attempts
	
	found = false
	puts "Welcome to the Accounts Menu. Please Login."
	print "Name: "
	name = gets.chomp.upcase
	print "Account Number: "
	acct_num = gets.chomp.to_i
	balance = 0
	#check to see if account exists and then determine 
	@accounts.each do |a|
		if a.name == name and a.account == acct_num
			balance = a.balance
			found = true
		end
	end


		if found == true
			view_account(name,acct_num,balance)
		elsif @count < 2
			@count += 1
			trys = 3 - @count
			puts "\n"
			puts "Account not found. You have #{trys} attempt(s) remaining.\n"
			account_menu
		else
			puts "\n"
			puts "Sorry, account not found. Please contact customer service\n"
			main_menu
		end
	

end

#---------------view account method --------------------/
def view_account(name,acct_num,balance)
	puts "\n"
	puts "Welcome to your account page, #{name.downcase.capitalize}"
	puts "Please make a selection to proceed:\n"

	puts "1. View balance"
	puts "2. Make a deposit"
	puts "3. Make a withdrawl"
	puts "4. Back to main menu"

	print "Choice: "
	choice = gets.chomp.to_i

	case choice 

	when 1
		view_balance(name,acct_num,balance)
	when 2
		make_deposit(name,acct_num) 
	when 3 
		make_withdrawl(name,acct_num)
	when 4
		main_menu
	else
		puts "Invalid entry."
		view_account(name,acct_num)
	end
end

def view_balance(name,acct_num,balance)
	puts "Your current balance is #{balance}"
	view_account(name,acct_num,balance)
end


# ----------- make depost method --------------/
# you can pass balance to it, but wont be changing it becuase its actually a variable, and not the instance



def make_deposit(name,acct_num)
	balance = 0
	puts "How much would you like to deposit?"
	amount = gets.chomp.to_f
	@accounts.each do |a|
		if a.name == name and a.account == acct_num
			a.add_bitcoin(amount)
			balance = a.balance
			# puts "Your deposit of $#{amount} bitcoin has been made. Your new balance is $#{a.balance}."
		end
	end
	view_account(name,acct_num,balance)
end


# ---------------- make withdrawl method --------------/

def make_withdrawl(name,acct_num)
	balance = 0
	puts "How much would you like to withdraw?"
	amount = gets.chomp.to_f
	@accounts.each do |a|
		if a.name == name and a.account == acct_num
			a.sub_bitcoin(amount)
			balance = a.balance
		end			
	end	
end



#---------------- main program ----------------#

@count = 0
@accounts = Array.new   #@ just means instance variable, allows your methods to see them

main_menu






