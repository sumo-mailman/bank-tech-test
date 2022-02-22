require 'account'

describe Account do 
  it 'initialises a new account with no balance' do 
    expect(subject.balance).to eq 0
  end

  it 'stores the transactions' do 
    subject.deposit(1000, '10-01-2023')
    subject.withdraw(500, '14/01/2023')
    expect(subject.transactions.length).to eq 2
  end 

  describe '#deposit' do

    context 'can deposit money' do
      it 'can deposit money' do 
        subject.deposit(1000, '10-01-2023')
        expect(subject.balance).to eq 1000
      end

      it 'can only enter in dates in the correct format' do
        date = '10-01-2023'
        subject.deposit(1000, date)
        expect(date).to match(/\d\d-\d\d-\d\d/)
        expect(subject.balance).to eq 1000
      end
    end
  end 

  describe '#withdraw' do
    context 'has balance less than withdraw amount' do 
      it 'cannot withdraw money' do 
        expect { subject.withdraw(500, '14/01/2023') }.to raise_error "Insufficient balance to withdraw"
      end 
    end 

    context 'has balance greater than withdraw amount' do
      it 'can withdraw money' do 
        subject.deposit(1000, '10-01-2023')
        subject.withdraw(500, '14/01/2023')
        expect(subject.balance).to eq 500
      end 
    end
  end 

  describe '#record_transaction' do
    it 'can record transactions' do 
      subject.deposit(1000, '10-01-2023')
      expect(subject.transactions.last).to_not contain_exactly(1000, '10-01-2023')
    end 
  end 
end 
