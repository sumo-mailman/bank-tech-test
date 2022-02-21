class Account 
  attr_reader :balance, :transactions
  
  DEFAULT_BALANCE = 0 

  def initialize
    @balance = DEFAULT_BALANCE
    @transactions = []
  end 

  def deposit(amount, date)
    @balance += amount
    record_deposit(amount,date)
  end
  
  def withdraw(amount, date)
    withdraw_balance = @balance -= amount
    record_withdrawal(amount, date) 
  end

private

  def record_withdrawal(amount, date) 
    transactions << {balance: @balance, debit: amount, date: date}
  end 

  def record_deposit(amount,date)
    @transactions << {balance: @balance, credit: amount, date: date}
  end 

  def show_statement
    "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      "#{transaction[:date]}|| #{transaction[:credit]}|| #{transaction[:debit]} || #{transaction[:balance]}"
    end 
  end 
end 

