require 'account'


describe Account do 
  it 'is a new bank account with default value of 0' do 
    expect(subject.balance).to be 0
  end 

  it 'can deposit money' do 
    subject.deposit(500)
    expect(subject.balance).to eq 500
  end 

  it 'can withdraw money' do 
    subject.deposit(500)
    subject.withdraw(500)
    expect(subject.balance).to eq 0
  end 
end 