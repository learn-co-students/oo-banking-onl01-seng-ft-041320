class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  def initialize (sender, receiver, num)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = num
  end

  def valid?
    sender.valid? and receiver.valid?
  end

  def execute_transaction
    if (sender.balance > amount) && valid? && self.status != "complete"
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end



end
