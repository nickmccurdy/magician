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
    expect(0.prime?).to be false
    expect(1.prime?).to be false
    expect(2.prime?).to be true
    expect(5.prime?).to be true
    expect(6.prime?).to be false

    expect(-1.prime?).to be false
    expect(-2.prime?).to be false
    expect(-5.prime?).to be false
    expect(-6.prime?).to be false
  end

  it 'determines if it is pandigital' do
    expect(123_456_789.pandigital?).to be true
    expect(987_654_321.pandigital?).to be true
    expect(192_837_465.pandigital?).to be true

    expect(12_345.pandigital?).to                  be false
    expect(1_234_567_890.pandigital?).to           be false
    expect(1_234_567_899.pandigital?).to           be false
    expect(112_233_445_566_778_899.pandigital?).to be false
  end

  it 'determines if it is a palindrome' do
    expect(123_454_321.palindrome?).to be true
    expect(1.palindrome?).to           be true

    expect(123.palindrome?).to be false
    expect(321.palindrome?).to be false
  end

end
