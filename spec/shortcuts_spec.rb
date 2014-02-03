require 'spec_helper'

describe 'Shortcuts' do

  it 'properly aliases certain values from Math' do
    expect(PI).to           eq Math::PI
    expect(E).to            eq Math::E
    expect(I).to            eq Complex::I
    expect(GOLDEN_RATIO).to eq (1 + Math.sqrt(5)) / 2
  end

end
