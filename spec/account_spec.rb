require 'account'

describe Account do 
  it 'initialises a new account with no balance' do 
    expect(subject.balance).to eq 0
  end

  it 'stores the transactions' do 
    subject.deposit(1000, '10/01/2023')
    subject.withdraw(500, '14/01/2023')
    expect(subject.transactions.length).to eq 2
  end 

  describe '#deposit' do
    context 'can deposit money' do
      it 'can deposit money' do 
        subject.deposit(1000, '10/01/2023')
        expect(subject.balance).to eq 1000
      end
    end

    context 'cannot deposit money' do 
      it 'can only enter in dates in the correct format' do
        expect { subject.deposit(500, '14-01-2023') }.to raise_error "Incorrect date format, must use DD/MM/YYYY"
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
        subject.deposit(1000, '10/01/2023')
        subject.withdraw(500, '14/01/2023')
        expect(subject.balance).to eq 500
      end 
    end
  end 

  describe '#record_transaction' do
    it 'can record transactions' do 
      subject.deposit(1000, '10/01/2023')
      expect(subject.transactions.last).to_not contain_exactly(1000, '10/01/2023')
    end 
  end 

  describe '#valid_date' do 
    it 'checks valid dates' do 
      expect(subject.valid_date('20-10-2020')).to eq nil
      expect(subject.valid_date('20-10-19926')).to eq nil
      expect(subject.valid_date('20th October')).to eq nil
      expect(subject.valid_date('Monday')).to eq nil
      expect(subject.valid_date('20/10/2020')).to eq true
    end 
  end

  describe '#show_header' do
  let(:header) { 'date || credit || debit || balance' }
  let(:transactions) { '10/01/2023 || 1000 ||  || 1000' }

    it 'shows a header' do 
      subject.deposit(1000, '10/01/2023')
      expect { subject.display_summary }.to output(/"#{header}#{transactions}"/).to_stdout
    end 
  end


end 


# class MakeIt
#   def awesome(text)
#     puts "Awesome #{text}"
#   end
# end


# describe MakeIt do
#   describe '#awesome' do
#     it 'prints awesome things' do
#       expect do
#         MakeIt.new.awesome('tests')
#       end.to output('Awesome tests').to_stdout
#     end
