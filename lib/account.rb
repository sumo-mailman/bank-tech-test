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

  def withdraw(amount, date)
    @balance -= amount
    @transactions << {balance: @balance, debit: amount, date: date}
  end

  def show_statement
    puts "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      puts "#{transaction[:date]}|| #{transaction[:credit]}|| #{transaction[:debit]} || #{transaction[:balance]}"
    end 
  end 
end 


a = Account.new
a.deposit(500, '10-01-2023')
a.withdraw(2000, '13-01-2023')
a.balance
a.withdraw(1000, '14-01-2023')