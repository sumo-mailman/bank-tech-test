# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:amount) { 500 }
  let(:date) { '10/01/2023' }
  let(:balance) { 500 }
  let(:transaction) { described_class.new(amount, date, balance) }

  it 'returns the amount deposited' do
    expect(transaction.amount).to eq 500
  end
end
