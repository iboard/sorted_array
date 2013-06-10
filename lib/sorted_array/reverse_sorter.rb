module SortedArray

  # Sorts and then reverse the array
  class ReverseSorter < DefaultSorter

    # @param [Object] array - must implement sort! and reverse!
    # @return [Object] - the given object, sorted and reversed
    def sort(array)
      super
      array.reverse!
    end

  end
end
