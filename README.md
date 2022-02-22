# Bank Tech Test

## Test Coverage

- 100% test coverage
- 10 examples, 0 failures

## Run File

```
> bundle install

```

## Example Input

```
a = Account.new
a.deposit(1000, '10/01/2023')
a.deposit(2000, '13/01/2023')
a.withdraw(500, '14/01/2023')
a.display_summary
```

## Example Output Format

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## User Stories

```
As a potential customer,
So that I can become a customer
I would like to create a bank account
```

```
As a bank customer,
So that I can save money
I would like to deposit my money.
```

```
As a bank customer,
So that I can spend money
I would like to withdraw my money
```

```
As a bank customer,
So that I can know my previous transactions
I would like to show bank statement with transaction: date, amount and balance
```

## Domain Model:

<p style="text-align: center">
  <img src="https://i.imgur.com/yjSwiEN.jpg">
</p>

## Edge Cases

- entering dates which are not in an appropriate date format
- trying to withdraw money when there's insufficient balance

## Pending:

1. How to extract more methods from account. Potentially a display/formatting of the summary in a separate class?

2. Additional tests for further edge cases
