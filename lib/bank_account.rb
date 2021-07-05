class BankAccount
 attr_accessor :balance, :status
 attr_reader :name
 def initialize(name, balance = 1000, status = "open")
    @status = status
    @balance = balance
    @name = name
 end

 def deposit(amount)
   @balance = @balance + amount
 end

 def display_balance
    "Your balance is $#{@balance}."
 end

 def valid?
   (self.status == "open" && @balance > 0) ? true : false
 end
 
 def close_account
   self.status = "closed"
 end
end
