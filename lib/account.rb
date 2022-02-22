require 'date'
require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
    @transactions = []
  end

  def deposit(amount, date)
    raise 'Incorrect date format, must use DD/MM/YYYY' if valid_date(date).nil?
    update_balance(amount)
    record_transaction(amount, date)
  end

  def withdraw(amount, date)
    raise 'Insufficient balance to withdraw' if amount > @balance
    update_balance(-amount)
    record_transaction(-amount, date)
  end

  def display_summary
    show_header
    show_transactions
  end

  def valid_date(date)
    date_format = '%d/%m/%y'
    DateTime.strptime(date, date_format)
    true
    rescue ArgumentError
  end

  private

  def update_balance(amount)
    @balance += amount
  end

  def record_transaction(amount, date)
    @transactions << Transaction.new(amount, date, @balance)
  end

  def show_header
    puts 'date || credit || debit || balance'
  end

  def show_transactions
    @transactions.each do |transaction|
      amount = transaction.amount
      puts "#{transaction.date} || #{amount unless amount.negative?} ||
      #{-amount unless amount.positive?} || #{transaction.balance}"
    end
  end
end
