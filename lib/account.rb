require_relative 'transaction'

class Account 
  attr_reader :balance, :transactions

  DEFAULT_BALANCE = 0

  def initialize 
    @balance = DEFAULT_BALANCE 
    @transactions = []
  end

  def deposit(amount, date)
    
    update_balance(amount, date)
    record_transaction(amount, date)
  end

  def withdraw(amount, date) 
    raise "Insufficient balance to withdraw" if amount > @balance 
    update_balance(-amount, date)
    record_transaction(-amount, date)
  end 

  def display_summary
    show_header
    show_transactions
  end 


  private

  def update_balance(amount, date)
    @balance += amount
  end 

  def record_transaction(amount, date)
    @transactions << Transaction.new(amount, date, @balance)
  end

  def show_header
    puts "date || credit || debit || balance"
  end 

  def show_transactions
    @transactions.each do |transaction| 
      amount = transaction.amount 
      puts "#{transaction.date} || #{amount unless amount < 0} || #{-amount unless amount > 0} || #{transaction.balance}"
    end
  end 

end

a = Account.new
a.deposit(1000, '10/01/2023')
a.deposit(2000, '13/01/2023')
a.withdraw(500, '14/01/2023')
a.display_summary
