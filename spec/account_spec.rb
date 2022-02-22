require 'account'

describe Account do 
  it 'initialises a new account with no balance' do 
    expect(subject.balance).to eq 0
  end 
  

end 
