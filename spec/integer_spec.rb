require 'spec_helper'

describe Integer do

  it 'calculates its factors' do
    expect(1.factors).to eq [1]
    expect(6.factors).to eq [1, 2, 3, 6]
    expect(7.factors).to eq [1, 7]

    expect(-1.factors).to eq [1]
    expect(-6.factors).to eq [1, 2, 3, 6]
    expect(-7.factors).to eq [1, 7]

    expect { 0.factors }.to raise_error ArgumentError
  end

  it 'calculates its factorial' do
    expect(0.factorial).to  eq 1
    expect(1.factorial).to  eq 1
    expect(-1.factorial).to eq nil
    expect(5.factorial).to  eq 120
    expect(10.factorial).to eq 3_628_800
  end

  it 'determines if it is prime' do
    expect(0.prime?).to be_false
    expect(1.prime?).to be_false
    expect(2.prime?).to be_true
    expect(5.prime?).to be_true
    expect(6.prime?).to be_false

    expect(-1.prime?).to be_false
    expect(-2.prime?).to be_false
    expect(-5.prime?).to be_false
    expect(-6.prime?).to be_false
  end

  it 'determines if it is pandigital' do
    expect(123456789.pandigital?).to be_true
    expect(987654321.pandigital?).to be_true
    expect(192837465.pandigital?).to be_true

    expect(12345.pandigital?).to              be_false
    expect(1234567890.pandigital?).to         be_false
    expect(1234567899.pandigital?).to         be_false
    expect(112233445566778899.pandigital?).to be_false
  end

  it 'determines if it is a palindrome' do
    expect(123454321.palindrome?).to be_true
    expect(1.palindrome?).to         be_true

    expect(123.palindrome?).to be_false
    expect(321.palindrome?).to be_false
  end

end
