require 'spec_helper'

describe Numeric do

  it 'determines if it is divisible by another number' do
    expect(0.divisible?(5)).to      be true
    expect(1.divisible?(6)).to      be false
    expect(-1.divisible?(1)).to     be true
    expect(12.divisible?(6)).to     be true
    expect(6.divisible?(5)).to      be false
    expect(10.divisible?(0)).to     be false
    expect(9.divisible?(1.5)).to    be true
    expect(9.0.divisible?(1.5)).to  be true
    expect(10.5.divisible?(1.5)).to be true
    expect(10.5.divisible?(1)).to   be false
  end

  it 'grabs specific digits from different numbers' do
    expect(Math::PI.digits(0..-1)).to eq 3
    expect(12_345.digits(0..2)).to    eq 123
    expect(12_345.digits(4)).to       eq 5
  end

  it 'converts angles to radians' do
    expect(0.to_radians).to   eq 0
    expect(90.to_radians).to  eq PI / 2
    expect(180.to_radians).to eq PI
    expect(270.to_radians).to eq 3 * PI / 2
    expect(360.to_radians).to eq 2 * PI
    expect(-90.to_radians).to eq -PI / 2
  end

  it 'converts angles to degrees' do
    expect(0.to_degrees).to            eq 0
    expect((PI / 2).to_degrees).to     eq 90
    expect(PI.to_degrees).to           eq 180
    expect((3 * PI / 2).to_degrees).to eq 270
    expect((2 * PI).to_degrees).to     eq 360
    expect((-PI / 2).to_degrees).to    eq -90
  end

end
