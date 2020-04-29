class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if (@status == "pending") && (self.valid?) && (@amount <= self.sender.balance)
      self.sender.deposit(-@amount)
      self.receiver.deposit(@amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    #   if self.valid?
    #     if @amount <= self.sender.balance
    #       self.sender.deposit(-@amount)
    #       self.receiver.deposit(@amount)
    #       self.status = "complete"
    #     else
    #       self.status = "rejected"
    #       "Transaction rejected. Please check your account balance."
    #     end
    #   else
    #     self.status = "rejected"
    #     "Transaction rejected. Please check your account balance."
    #   end
    # end
  end
  
  def reverse_transfer
    if (@status == "complete")
      self.receiver.deposit(-@amount)
      self.sender.deposit(@amount)
      self.status = "reversed"
    end
  end
end
