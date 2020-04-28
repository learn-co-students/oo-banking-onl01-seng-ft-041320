class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  @@all =  []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all.push(self)
  end

  def self.all
    @@all
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.sender.balance >= self.amount
  end

  def execute_transaction
    return "Transaction is already complete." if self.status == "complete"
    if !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      self.status = "complete"
      self.sender.deposit(self.amount * -1)
      self.receiver.deposit(self.amount)
    end
  end

  def reverse_transfer
    if Transfer.all.last.status == "complete"
      Transfer.all.last.receiver.deposit(Transfer.all.last.amount * -1)
      Transfer.all.last.sender.deposit(Transfer.all.last.amount)
      Transfer.all.last.status = "reversed"
    end
  end
end
