class Transfer

  attr_accessor :status, :amount
  attr_reader :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
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
    if @status == "complete"
      @sender.deposit(@amount) && @receiver.deposit(-@amount) && @status = "reversed"
    end
  end

end
