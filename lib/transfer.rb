require "pry"

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, status = "pending", amount)
    @sender= sender
    @receiver= receiver
    @status= status
    @amount= amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    
    if self.valid? && @sender.balance > @amount && @status != "complete" && @status != "rejected"
      @sender.deposit(-@amount) && @receiver.deposit(@amount) && @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.deposit(@amount)  && @receiver.deposit(-@amount)  && @status = "reversed"
    end
  end
end
