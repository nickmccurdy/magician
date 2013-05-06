require "#{File.dirname __FILE__}/spec_helper"

describe Enumerable do

  before :all do
    class String
      include Enumerable
    end
  end

  it 'should return all of its Numerics in order' do
    [1, 2.0, -3].numerics.should          == [1, 2.0, -3]
    ['string'].numerics.should            == []
    [].numerics.should                    == []
    [1, 'two', 3, 'four'].numerics.should == [1, 3]
    (1..10).numerics.should               == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  it 'should calculate its sum' do
    [].sum.should           == 0
    [1].sum.should          == 1
    [1, 2, 3, 4].sum.should == 10
    [-4, 0, 5].sum.should   == 1
    (1..10).sum.should      == 55

    expect { ['string'].sum }.to    raise_error RuntimeError
    expect { ['string', 1].sum }.to raise_error RuntimeError
  end

  it 'should calculate its (numeric) product' do
    [].numeric_product.should        == 1
    [1].numeric_product.should       == 1
    [5, 7, 2].numeric_product.should == 70
    (1..10).numeric_product.should   == 3628800

    expect { ['string'].numeric_product }.to    raise_error RuntimeError
    expect { ['string', 1].numeric_product }.to raise_error RuntimeError
  end

  it 'should calculate its middle' do
    [].middle.should              == nil
    [4].middle.should             == 4.0
    [2, 1, 5, 4, 3].middle.should == 5.0
    [1, 2, 3, 4].middle.should    == 2.5
    [1, 2, 4, 3].middle.should    == 3.0
    (1..10).middle.should         == 5.5

    expect { ['string', 4].middle }.to raise_error RuntimeError
  end

  it 'should calculate its range' do
    [].range.should         == nil
    [4].range.should        == 0
    [5, 1, 10].range.should == 9
    (1..10).range.should    == 9

    expect { ['string'].range }.to    raise_error RuntimeError
    expect { ['string', 4].range }.to raise_error RuntimeError
  end

  it 'should calculate its mean' do
    [].mean.should              == nil
    [4].mean.should             == 4
    [-3, 0, 6].mean.should      == 1
    [1, 2, 3, 4, 5].mean.should == 3
    (1..10).mean.should         == 5.5

    expect { ['string'].mean }.to    raise_error RuntimeError
    expect { ['string', 4].mean }.to raise_error RuntimeError
  end

  it 'should calculate its median' do
    [].median.should              == nil
    [4].median.should             == 4.0
    [2, 1, 5, 4, 3].median.should == 3.0
    [1, 2, 3, 4].median.should    == 2.5
    (1..10).median.should         == 5.5

    expect { ['string', 4].median }.to raise_error RuntimeError
  end

  it 'should calculate its mode' do
    [].mode.should            == nil
    ['string'].mode.should    == ['string']
    [4].mode.should           == [4]
    ['string', 4].mode.should == ['string',4]
    (1..5).mode.should        == [1, 2, 3, 4, 5]

    [1, 2, 1, 3, 1, 4].mode.should    == [1]
    [1, 1, 1, 2, 2, 2, 3].mode.should == [1, 2]
  end

  it 'should calculate a hash holding numbers of occurrences of its items' do
    [].occurences.should            == {}
    ['string'].occurences.should    == { 'string'=>1 }
    [4].occurences.should           == { 4=>1 }
    ['string', 4].occurences.should == { 'string'=>1, 4=>1 }
    (1..3).occurences.should        == { 1=>1, 2=>1, 3=>1 }

    [1, 2, 2, 5].occurences.should == { 1=>1, 2=>2, 5=>1 }
  end

  it 'should calculate its length' do
    [].length.should      == 0
    (2..1).length.should  == 0

    [1, 2].length.should  == 2
    (1..10).length.should == 10
  end

  it 'should determine if it is empty' do
    [].empty?.should      be_true
    (2..1).empty?.should  be_true

    [1, 2].empty?.should  be_false
    (1..10).empty?.should be_false
  end

  it 'should let Enumerable#average be used as an alias to Enumerable#mean' do
    [4].average.should == 4.0
    (1..10).average.should == 5.5
  end

  it 'should let Enumerable#size be used as an alias to Enumerable#length' do
    [1, 2].size.should  == 2
    (1..10).size.should == 10
  end

  it 'should determine if it is a palindrome' do
    [1, 2, 3, 2, 1].palindrome?.should be_true
    (1..1).palindrome?.should be_true
    ''.palindrome?.should        be_true
    'a'.palindrome?.should       be_true
    'deed'.palindrome?.should    be_true
    'racecar'.palindrome?.should be_true

    [1, 2, 3, 4, 5].palindrome?.should be_false
    (1..5).palindrome?.should be_false
    'cats'.palindrome?.should be_false
    'no'.palindrome?.should   be_false
  end

end
