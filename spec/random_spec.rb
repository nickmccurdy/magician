require 'spec_helper'

describe Random do

  before :each do
    @r = Random.new
  end

  it 'gets a random boolean' do
    5.times { expect([true, false]).to include @r.boolean }
  end

  it 'gets a random coin toss' do
    5.times { expect(['heads', 'tails']).to include @r.coin }
  end

  it 'gets a random die roll' do
    5.times { expect(1..6).to include @r.die }
  end

end
