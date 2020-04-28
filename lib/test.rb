require "pry"
require_relative "./bank_account.rb"
require_relative "./transfer.rb"

alex = BankAccount.new("Alex")
amanda = BankAccount.new("Amanda")
new_transfer = Transfer.new(alex, amanda, 100)
binding.pry