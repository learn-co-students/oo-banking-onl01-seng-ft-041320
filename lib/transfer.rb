class Transfer
  attr_accessor :status, :amount, :receiver, :sender

  @@all = []

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
    @@all << self
  end

  def valid?
    @receiver.valid? && @sender.valid?
  end

  def execute_transaction
    if valid? && @sender.balance >= @amount  && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && @receiver.balance >= @amount  && status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

  def self.all
    @@all
  end
end
