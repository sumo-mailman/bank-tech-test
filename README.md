Givena client makes a deposit of 1000 on 10-01-2023Anda deposit of 2000 on 13-01-2023Anda withdrawal of 500 on 14-01-2023
Whenshe prints her bank statementThenshe would see

account = Account.new
account.deposit(amount: 500, date: 10-01-2023)
account.deposit(amount: 2000, date: 13-01-2023)
account.withdraw(amount: 500, date: 14-01-2023)
account.show_statement

Print:
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00

# Edge Cases

Can't withdraw > balance amount, raise error if so

require './lib/account.rb'

a = Account.new
a.deposit(500, '10-01-2023')
a.withdraw(2000, '13-01-2023')
a.withdraw(1000, '14-01-2023')

a = Account.new
t = Transaction.new
t.deposit(500, '10-01-2023')
