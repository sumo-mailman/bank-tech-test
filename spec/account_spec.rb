require 'account'


describe Account do 
  it 'is a new bank account with default value of 0' do 
    expect(subject.balance).to be 0
  end 


  describe '#deposit' do 

    it 'can deposit money' do 
      subject.deposit(500, '10-01-2023')
      expect(subject.balance).to eq 500
    end 

    it 'stores transaction details' do
      subject.deposit(500, '10-01-2023')
      expect(subject.transactions.last).to include(:balance => 500, :date => '10-01-2023', :credit => 500)
    end
  end 


  describe '#withdraw' do 
    it 'can withdraw money' do 
      subject.deposit(500, '10-01-2023')
      subject.withdraw(500, '14-01-2023')
      expect(subject.balance).to eq 0
    end

    it 'stores transaction details' do 
      subject.deposit(500, '10-01-2023')
      subject.withdraw(500, '14-01-2023')
      expect(subject.transactions.length).to be(2)
      expect(subject.transactions.last).to include(:balance => 0, :date => '14-01-2023', :debit => 500)
    end
  end 

  # need to fix a show_statement test 
  describe '#show_statement' do 
    it 'prints a summary of transactions' do 
      subject.deposit(500, '10-01-2023')
      subject.withdraw(2000, '13-01-2023')
      subject.withdraw(500, '14-01-2023')
      expect(subject.show_statement)
    end 
  end 
end