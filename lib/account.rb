class Account 
  attr_reader :balance, :transactions
  
  DEFAULT_BALANCE = 0 

  def initialize
    @balance = DEFAULT_BALANCE
    @transactions = []
  end 

  def deposit(amount, date)
    @balance += amount
    @transactions << {balance: @balance, credit: amount, date: date}
  end

  # Extract Method 
  def withdraw(amount, date)
    withdraw_balance = @balance -= amount
    add_withdraw_transaction(amount, date) 
  end

private

  def add_withdraw_transaction(amount, date) 
    transactions << {balance: @balance, debit: amount, date: date}
  end 


  def show_statement
    "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      "#{transaction[:date]}|| #{transaction[:credit]}|| #{transaction[:debit]} || #{transaction[:balance]}"
    end 
  end 
end 

