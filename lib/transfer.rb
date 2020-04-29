require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  
  def execute_transaction
    if @sender.balance < @amount || self.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      puts "Transaction was already excuted"
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
    @sender.balance += @amount 
    @receiver.balance -= @amount
    self.status = "reversed"
    end
  end
end
