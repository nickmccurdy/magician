# Magician's extensions to the Enumerable module.
module Enumerable

  # Returns all numbers from the Enumerable, in their original order. This is
  # done by choosing all objects from the Enumerable that are instances of
  # Numeric or one of its subclasses.
  #
  # @return [Array] an array containing all of the Numerics from the Enumerable
  def numerics
    select { |item| item.is_a? Numeric }
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
  # an empty Enumerable is nil. Note that this method relies on a working to_a
  # method for this Enumerable. The Enumerable must only contain Numerics or a
  # RuntimeError will be raised.
  #
  # @return [Numeric, nil] the middle of the elements of the Enumerable
  #
  # @raise [RuntimeError] if the Enumerable contains non-Numeric objects
  def middle
    require_numerics
    return nil if empty?

    array = to_a
    middle_index = array.length / 2

    length.odd? ? array[middle_index] : [array[middle_index-1], array[middle_index]].mean
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
    each_with_object(Hash.new 0) { |item, occurences| occurences[item] += 1 }
  end

  # Returns true if the Enumerable is a palindrome (meaning it is the same
  # forward and backward). This method relies on a working each_with_index
  # method on the Enumerable. However, Enumerable objects that are instances of
  # String or one of its subclasses will rely on the each_char method instead.
  #
  # @return [Boolean] true if the Enumerable is a palindrome
  def palindrome?
    array_of_enum = []
    if is_a? String
      each_char { |item| array_of_enum << item }
    else
      each_with_index { |item| array_of_enum << item }
    end

    array_of_enum == array_of_enum.reverse
  end

  # Gets the number of elements in the Enumerable. This works by converting the
  # Enumerable to an array and then getting its length.
  #
  # @return [Fixnum] the length of the Enumerable
  def length
    to_a.length
  end

  # Returns true if the Enumerable contains no elements. This works by
  # converting the Enumerable to an array and then checking if that is empty.
  #
  # @return [Boolean] true if the Enumerable is empty
  def empty?
    to_a.empty?
  end

  # Alias average to mean.
  alias :average :mean

  # Alias size to length.
  alias :size :length

  private

  # Requires that all objects in the Enumerable are instances of Numeric (or one
  # of its subclasses), and raises an error if they are not.
  #
  # @raise [RuntimeError] if the Enumerable contains non-Numeric objects
  def require_numerics
    unless all? { |item| item.is_a? Numeric }
      calling_method = caller[0][/`.*'/][1..-2]
      raise RuntimeError, "Enumerable##{calling_method} requires that the Enumerable only contains Numeric objects."
    end
  end

end

# String objects do not properly inherit these new methods for Enumerable. As a
# result, String needs to include Enumerable again for these methods to be used
# on Strings.
class String
  include Enumerable
end
