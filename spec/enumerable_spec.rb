require 'spec_helper'

describe Enumerable do

  it 'returns all of its Numerics in order' do
    expect([1, 2.0, -3].numerics).to          eq [1, 2.0, -3]
    expect(['string'].numerics).to            eq []
    expect([].numerics).to                    eq []
    expect([1, 'two', 3, 'four'].numerics).to eq [1, 3]
    expect((1..10).numerics).to               eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  it 'calculates its sum' do
    expect([].sum).to           eq 0
    expect([1].sum).to          eq 1
    expect([1, 2, 3, 4].sum).to eq 10
    expect([-4, 0, 5].sum).to   eq 1
    expect((1..10).sum).to      eq 55

    expect { ['string'].sum }.to    raise_error RuntimeError
    expect { ['string', 1].sum }.to raise_error RuntimeError
  end

  it 'calculates its (numeric) product' do
    expect([].numeric_product).to        eq 1
    expect([1].numeric_product).to       eq 1
    expect([5, 7, 2].numeric_product).to eq 70
    expect((1..10).numeric_product).to   eq 3628800

    expect { ['string'].numeric_product }.to    raise_error RuntimeError
    expect { ['string', 1].numeric_product }.to raise_error RuntimeError
  end

  it 'calculates its middle' do
    expect([].middle).to              eq nil
    expect([4].middle).to             eq 4.0
    expect([2, 1, 5, 4, 3].middle).to eq 5.0
    expect([1, 2, 3, 4].middle).to    eq 2.5
    expect([1, 2, 4, 3].middle).to    eq 3.0
    expect((1..10).middle).to         eq 5.5

    expect { ['string', 4].middle }.to raise_error RuntimeError
  end

  it 'calculates its range' do
    expect([].range).to         eq nil
    expect([4].range).to        eq 0
    expect([5, 1, 10].range).to eq 9
    expect((1..10).range).to    eq 9

    expect { ['string'].range }.to    raise_error RuntimeError
    expect { ['string', 4].range }.to raise_error RuntimeError
  end

  it 'calculates its mean' do
    expect([].mean).to              eq nil
    expect([4].mean).to             eq 4
    expect([-3, 0, 6].mean).to      eq 1
    expect([1, 2, 3, 4, 5].mean).to eq 3
    expect((1..10).mean).to         eq 5.5

    expect { ['string'].mean }.to    raise_error RuntimeError
    expect { ['string', 4].mean }.to raise_error RuntimeError
  end

  it 'calculates its median' do
    expect([].median).to              eq nil
    expect([4].median).to             eq 4.0
    expect([2, 1, 5, 4, 3].median).to eq 3.0
    expect([1, 2, 3, 4].median).to    eq 2.5
    expect((1..10).median).to         eq 5.5

    expect { ['string', 4].median }.to raise_error RuntimeError
  end

  it 'calculates its mode' do
    expect([].mode).to            eq nil
    expect(['string'].mode).to    eq ['string']
    expect([4].mode).to           eq [4]
    expect(['string', 4].mode).to eq ['string',4]
    expect((1..5).mode).to        eq [1, 2, 3, 4, 5]

    expect([1, 2, 1, 3, 1, 4].mode).to    eq [1]
    expect([1, 1, 1, 2, 2, 2, 3].mode).to eq [1, 2]
  end

  it 'calculates a hash holding numbers of occurrences of its items' do
    expect([].occurences).to            eq({})
    expect(['string'].occurences).to    eq({ 'string'=>1 })
    expect([4].occurences).to           eq({ 4=>1 })
    expect(['string', 4].occurences).to eq({ 'string'=>1, 4=>1 })
    expect((1..3).occurences).to        eq({ 1=>1, 2=>1, 3=>1 })

    expect([1, 2, 2, 5].occurences).to eq({ 1=>1, 2=>2, 5=>1 })
  end

  it 'calculates its length' do
    expect([].length).to      eq 0
    expect((2..1).length).to  eq 0

    expect([1, 2].length).to  eq 2
    expect((1..10).length).to eq 10
  end

  it 'determines if it is empty' do
    expect([].empty?).to      be true
    expect((2..1).empty?).to  be true

    expect([1, 2].empty?).to  be false
    expect((1..10).empty?).to be false
  end

  it 'lets Enumerable#average be used as an alias to Enumerable#mean' do
    expect([4].average).to eq 4.0
    expect((1..10).average).to eq 5.5
  end

  it 'lets Enumerable#size be used as an alias to Enumerable#length' do
    expect([1, 2].size).to  eq 2
    expect((1..10).size).to eq 10
  end

  it 'determines if it is a palindrome' do
    expect([1, 2, 3, 2, 1].palindrome?).to be true
    expect((1..1).palindrome?).to be true
    expect(''.palindrome?).to        be true
    expect('a'.palindrome?).to       be true
    expect('deed'.palindrome?).to    be true
    expect('racecar'.palindrome?).to be true

    expect([1, 2, 3, 4, 5].palindrome?).to be false
    expect((1..5).palindrome?).to be false
    expect('cats'.palindrome?).to be false
    expect('no'.palindrome?).to   be false
  end

end
