require_relative 'transaction'

class Account 
  attr_reader :balance, :transactions

  DEFAULT_BALANCE = 0

  def initialize 
    @balance = DEFAULT_BALANCE 
    @transactions = []
  end


  def deposit(amount, date)
    @balance += amount
    record_transaction(amount, date)
  end

  def withdraw(amount, date) 
    @balance += -amount
    record_transaction(-amount, date)
  end 

  def record_transaction(amount, date)
    @transactions << Transaction.new(amount, date, @balance)
  end

end

# a = Account.new
# a.deposit(1000, '10/01/2023')
# a.deposit(2000, '13/01/2023')
# a.withdraw(500, '14/01/2023')
# print a.transactions