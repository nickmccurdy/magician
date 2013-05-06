# Magician's extensions to the Enumerable module.
module Enumerable

  # Returns all numbers from the Enumerable, in their original order. This is
  # done by choosing all objects from the Enumerable that are instances of
  # Numeric or one of its subclasses.
  #
  # @return [Array] an array containing all of the Numerics from the Enumerable
  def numerics
    select { |item| item.class <= Numeric }
  end

  # Gets the sum of the Enumerable's elements. The sum of an empty Enumerable is
  # 0. The Enumerable must only contain Numerics or a RuntimeError will be
  # raised.
  #
  # @return [Numeric] the sum of the elements of the Enumerable
  #
  # @raise [RuntimeError] if the Enumerable contains non-Numeric objects
  def sum
    require_numerics

    empty? ? 0 : reduce(:+)
  end

  # Gets the (numeric) product of the Enumerable's elements. The product of an
  # empty Enumerable is 1. The Enumerable must only contain Numerics or a
  # RuntimeError will be raised.
  #
  # @return [Numeric] the product of the elements of the Enumerable
  #
  # @raise [RuntimeError] if the Enumerable contains non-Numeric objects
  def numeric_product
    require_numerics

    empty? ? 1 : reduce(:*)
  end

  # Finds the middle element of the Enumerable. If the Enumerable has an even
  # number of elements, the middle two elements will be averaged. The middle of
  # an empty Enumerable is nil. The Enumerable must only contain Numerics or a
  # RuntimeError will be raised.
  #
  # @return [Numeric, nil] the middle of the elements of the Enumerable
  #
  # @raise [RuntimeError] if the Enumerable contains non-Numeric objects
  def middle
    require_numerics
    return nil if empty?

    middle_index = length / 2
    length.odd? ? slice(middle_index) : [slice(middle_index-1), slice(middle_index)].mean
  end

  # Gets the range of the elements of the Enumerable (maximum - minimum). The
  # range of an empty Enumerable is nil. The Enumerable must only contain
  # Numerics or a RuntimeError will be raised.
  #
  # @return [Numeric, nil] the range of the elements of the Enumerable
  #
  # @raise [RuntimeError] if the Enumerable contains non-Numeric objects
  def range
    require_numerics

    empty? ? nil : max - min
  end

  # Gets the mean (average) of the elements of the Enumerable. The mean of an
  # empty Enumerable is nil. The Enumerable must only contain Numerics or a
  # RuntimeError will be raised.
  #
  # @return [Float, nil] the mean (average) of the elements of the Enumerable
  #
  # @raise [RuntimeError] if the Enumerable contains non-Numeric objects
  def mean
    require_numerics

    empty? ? nil : sum.to_f / length
  end

  # Sorts the Enumerable and finds the element in the middle. The exact same
  # functionality can be achieved by sorting the Enumerable and then running the
  # middle method on it. The Enumerable must only contain Numerics or a
  # RuntimeError will be raised.
  #
  # @see middle
  #
  # @return [Numeric, nil] the median of the elements of the Enumerable
  #
  # @raise [RuntimeError] if the Enumerable contains non-Numeric objects
  def median
    require_numerics

    sort.middle
  end

  # Gets the mode(s) of the items in the Enumerable (the item(s) that occur(s)
  # most frequently). The mode of an empty Enumerable is nil.
  #
  # @return [Array, nil] an array of all of the items in the Enumerable that
  # occur the most frequently (they must all have the same number of
  # occurrences)
  def mode
    return nil if empty?

    occ = occurences
    max_occ = occ.values.max

    occ.select { |key, value| value == max_occ }.keys
  end

  # Gets a hash table with the number of occurrences of each item from the
  # original Enumerable. The keys are the items from the original Enumerable,
  # and the values are integers counting the number of occurrences of the
  # associated key values.
  #
  # @return [Hash] a hash table of the occurrences of each item from the
  # original Enumerable
  def occurences
    occurences = Hash.new 0
    each { |item| occurences[item] += 1 }
    occurences
  end

  # Alias average to mean.
  alias :average :mean

  private

  # Requires that all objects in the Enumerable are instances of Numeric (or one
  # of its subclasses), and raises an error if they are not.
  #
  # @raise [RuntimeError] if the Enumerable contains non-Numeric objects
  def require_numerics
    unless all? { |item| item.class <= Numeric }
      calling_method = caller[0][/`.*'/][1..-2]
      raise RuntimeError, "Enumerable##{calling_method} requires that the Enumerable only contains Numeric objects."
    end
  end

end
