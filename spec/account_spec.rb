require 'account'

describe Account do 
  it 'initialises a new account with no balance' do 
    expect(subject.balance).to eq 0
  end


  describe '#deposit' do
    it 'can deposit money' do 
      subject.deposit(1000, '10-01-2023')
      expect(subject.balance).to eq 1000
    end 
  end

  describe '#deposit' do
    it 'can withdraw money' do 
      subject.deposit(1000, '10-01-2023')
      subject.withdraw(500, '14/01/2023')
      expect(subject.balance).to eq 500
    end 
  end

  describe '#record_transaction' do
    it 'can record transactions' do 
      subject.deposit(1000, '10-01-2023')
      expect(subject.transactions.last).to_not contain_exactly(1000, '10-01-2023')
    end 
  end 
end 
