  
class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @status = "open"
        @balance = 1000
        @name = name
    end

    def deposit(deposit_money)
        self.balance +=  deposit_money
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def valid?
        balance > 0 && status == "open"
    end

    def close_account
        self.status = "closed"
    end
end