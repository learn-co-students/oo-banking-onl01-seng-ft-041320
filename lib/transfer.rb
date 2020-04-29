require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize (sender, receiver, status = "pending", transfer_amount)
    @sender = sender
    @receiver = receiver 
    @status = status
    @amount = transfer_amount
  end

 

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end

  end

  def execute_transaction

    if self.valid? && sender.balance >= self.amount && self.status != "complete"
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
    "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
     if @status == "complete"
       @receiver.balance -= self.amount
       @sender.balance += self.amount
       self.status = "reversed"
     end

  end


end

#     it "can execute a successful transaction between two accounts" do
#       transfer.execute_transaction
#       expect(amanda.balance).to eq(950)
#       expect(avi.balance).to eq(1050)
#       expect(transfer.status).to eq("complete")
#     end

#     it "each transfer can only happen once" do
#       transfer.execute_transaction
#       expect(amanda.balance).to eq(950)
#       expect(avi.balance).to eq(1050)
#       expect(transfer.status).to eq("complete")
#       transfer.execute_transaction
#       expect(amanda.balance).to eq(950)
#       expect(avi.balance).to eq(1050)
#     end

#     it "rejects a transfer if the sender does not have enough funds (does not have a valid account)" do
#       terrance.close_account
#       closed_account_transfer = Transfer.new(amanda, terrance, 50)
#       expect(closed_account_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
#       expect(closed_account_transfer.status).to eq("rejected")

#       expect(bad_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
#       expect(bad_transfer.status).to eq("rejected")
#     end
#   end

#   describe '#reverse_transfer' do
#     it "can reverse a transfer between two accounts" do
#       transfer.execute_transaction
#       expect(amanda.balance).to eq(950)
#       expect(avi.balance).to eq(1050)
#       transfer.reverse_transfer
#       expect(avi.balance).to eq(1000)
#       expect(amanda.balance).to eq(1000)
#       expect(transfer.status).to eq("reversed")
#     end

#     it "it can only reverse executed transfers" do
#       transfer.reverse_transfer
#       expect(amanda.balance).to eq(1000)
#       expect(avi.balance).to eq(1000)
#     end
#   end
# end
