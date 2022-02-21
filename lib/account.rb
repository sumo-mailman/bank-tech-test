class Account 
  attr_reader :balance, :transaction
  
  DEFAULT_BALANCE = 0 

  def initialize
    @balance = DEFAULT_BALANCE
    @transaction = []
  end 

  def deposit(amount, date)
    @balance += amount
    @transaction << {balance: @balance, credit: amount, date: date}
  end

  def withdraw(amount, date)
    @balance -= amount
    @transaction << {balance: @balance, debit: amount, date: date}
  end

end 


