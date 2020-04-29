class Transfer

  attr_accessor :transfer, :sender, :receiver, :status, :amount
  #attr_reader :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender = BankAccount.new(self.sender)
    receiver = BankAccount.new(self.receiver)
    if sender.name.valid? && receiver.name.valid?
      return true
    end
  end

  def execute_transaction
    while self.status == "pending"
    if !self.valid? || self.sender.balance < @amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    self.receiver.balance = 1000
    self.sender.balance = 1000
    self.status = "reversed"
  end
  end





end
