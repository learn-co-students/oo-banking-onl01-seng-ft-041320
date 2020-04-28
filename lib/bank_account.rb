class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name, balance = 1000, status = "open")
        @name = name 
        @status = status
        @balance = balance
    end

    def deposit(money)
        @balance += money.to_i
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def valid?
        status == "open" && balance > 0
    end

    def close_account
        @status = "closed"
    end
end
