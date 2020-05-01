class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @name = name 
        @balance = 1000
        @status = "open"
    end

    def deposit(amount)
        self.balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.status == "open" && self.balance > 0
            true
        else
            false
        end
    end

    def close_account
        if self.status == "open" && self.balance = 0
            self.status = "closed"
        end
    end

end
