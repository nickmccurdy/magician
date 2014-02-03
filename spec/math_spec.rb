require 'spec_helper'

describe Math do

  it 'solves quadratic formulas' do
    expect(Math.quadratic(1, 2, 1)).to eq [-1.0, -1.0]
    expect(Math.quadratic(1, 1, 0)).to eq [-1.0, 0.0]
    expect(Math.quadratic(1, 0, 0)).to eq [0.0, 0.0]

    expect { Math.quadratic(0, 1, 2) }.to raise_error ArgumentError
  end

  it 'calculates permutations of n and k' do
    expect(Math.permutations(10, 5)).to eq 30_240
    expect(Math.permutations(5, 5)).to  eq 120
    expect(Math.permutations(5, 0)).to  eq 1
    expect(Math.permutations(0, 0)).to  eq 1

    expect { Math.permutations(0, 5) }.to   raise_error ArgumentError
    expect { Math.permutations(5, 10) }.to  raise_error ArgumentError
    expect { Math.permutations(-5, 5) }.to  raise_error ArgumentError
    expect { Math.permutations(5, -5) }.to  raise_error ArgumentError
    expect { Math.permutations(-5, -5) }.to raise_error ArgumentError
  end

  it 'calculates combinations of n and k' do
    expect(Math.combinations(10, 5)).to eq 252
    expect(Math.combinations(5, 5)).to  eq 1
    expect(Math.combinations(5, 0)).to  eq 1
    expect(Math.combinations(0, 0)).to  eq 1

    expect { Math.combinations(5, 10) }.to  raise_error ArgumentError
    expect { Math.combinations(0, 5) }.to   raise_error ArgumentError
    expect { Math.combinations(-5, 5) }.to  raise_error ArgumentError
    expect { Math.combinations(5, -5) }.to  raise_error ArgumentError
    expect { Math.combinations(-5, -5) }.to raise_error ArgumentError
  end

  it 'calculates the number of steps to finish the Collatz conjecture' do
    expect(Math.collatz(1)).to   eq 0
    expect(Math.collatz(2)).to   eq 1
    expect(Math.collatz(7)).to   eq 16
    expect(Math.collatz(100)).to eq 25

    expect { Math.collatz(-1) }.to raise_error ArgumentError
    expect { Math.collatz(0) }.to  raise_error ArgumentError
  end

  it 'calculates the lengths of hypotenuses' do
    expect(Math.hypotenuse(0, 0)).to            eq 0
    expect(Math.hypotenuse(Math.sqrt(5), 2)).to eq 3
    expect(Math.hypotenuse(1, 1)).to            eq Math.sqrt(2)

    expect { Math.hypotenuse(5, -5) }.to raise_error ArgumentError
  end

  it 'determines if given numbers form Pythagorean triplets' do
    expect(Math.triplet?(3, 4, 5)).to   be true
    expect(Math.triplet?(5, 12, 13)).to be true
    expect(Math.triplet?(7, 24, 25)).to be true
    expect(Math.triplet?(8, 15, 17)).to be true
    expect(Math.triplet?(4, 3, 5)).to   be true

    expect(Math.triplet?(5, 4, 3)).to            be false
    expect(Math.triplet?(0, 0, 0)).to            be false
    expect(Math.triplet?(Math.sqrt(5), 2, 3)).to be false
    expect(Math.triplet?(1, 1, Math.sqrt(2))).to be false
    expect(Math.triplet?(-1, -1, -1)).to         be false
  end

  it 'calculates series of Fibonacci numbers of specified lengths' do
    expect(Math.fibs(0)).to  eq []
    expect(Math.fibs(1)).to  eq [1]
    expect(Math.fibs(2)).to  eq [1, 1]
    expect(Math.fibs(5)).to  eq [1, 1, 2, 3, 5]
    expect(Math.fibs(10)).to eq [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

    expect(Math.fibs(10, [5, 10])).to  eq [5, 10, 15, 25, 40, 65, 105, 170, 275, 445]
    expect(Math.fibs(1, [1, 2, 3])).to eq [1]

    expect { Math.fibs(-1) }.to         raise_error ArgumentError
    expect { Math.fibs(10, []) }.to     raise_error ArgumentError
    expect { Math.fibs(10, [9001]) }.to raise_error ArgumentError
  end

  it 'finds all prime numbers up to different integers' do
    expect(Math.primes(0)).to   eq []
    expect(Math.primes(1)).to   eq []
    expect(Math.primes(2)).to   eq [2]
    expect(Math.primes(5)).to   eq [2, 3, 5]
    expect(Math.primes(10)).to  eq [2, 3, 5, 7]
    expect(Math.primes(100)).to eq [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
  end

end
