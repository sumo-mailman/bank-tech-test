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
end 
