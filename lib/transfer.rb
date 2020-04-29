class Transfer


  attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
    end

    def valid?
      sender.valid? && receiver.valid?
    end

  def execute_transaction
       if valid? && status == "pending"
         if amount < self.sender.balance
           self.sender.balance -= amount
           self.receiver.balance += amount
           self.status = "complete"
         else
           self.status = "rejected"
             "Transaction rejected. Please check your account balance."
         end
       end
     end



    def reverse_transfer
      if @status == "complete"
        @sender.deposit( @amount )
        @receiver.deposit( @amount * -1)
        @status = "reversed"
      end
    end


end
