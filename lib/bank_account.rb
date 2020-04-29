class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    def initialize (name, balance = 1000, status = "open")
        @name = name
        @balance = 1000
        @status = status
        
    end

    def deposit(deposit)
        self.balance += deposit
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        if @status == "open" && @balance > 0
            true
        else
            false
        end
    end

    def close_account
       @status = "closed"
    end



end


    
      
    #     describe '#deposit' do
    #       it "can deposit money into its account" do
    #         expect(avi.balance).to eq(1000)
    #         avi.deposit(1000)
    #         expect(avi.balance).to eq(2000)
    #       end
    #     end
      
    #     describe '#display_balance' do
    #       it "can display its balance" do
    #         expect(avi.display_balance).to eq("Your balance is $#{avi.balance}.")
    #       end
    #     end
      
    #     describe '#valid?' do
    #       it "is valid with an open status and a balance greater than 0" do
    #         @broke = BankAccount.new("Kat Dennings")
    #         @broke.balance = 0
    #         @closed = BankAccount.new("Beth Behrs")
    #         @closed.status = "closed"
    #         expect(avi.valid?).to eq(true)
    #         expect(@broke.valid?).to eq(false)
    #         expect(@closed.valid?).to eq(false)
    #       end
    #     end
      
    #     describe '#close_account' do
    #       it "can close its account" do
    #         avi.close_account
    #         expect(avi.status).to eq("closed")
    #       end
    #     end
    #   end
      

