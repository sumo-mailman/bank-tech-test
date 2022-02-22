
class Account 
  attr_reader :balance, :transactions

  DEFAULT_BALANCE = 0

  def initialize 
    @balance = DEFAULT_BALANCE 
    @transactions = []
  end


  def deposit(amount, date)
    @balance += amount
  end 

  def record_transaction(amount, date)
    @transactions << [amount, date, balance]
  end


end