module SortedArray

  # A SortedArray takes a Sorter-object as a parameter.
  # The array gets sorted after each push,<<,unsift.
  # It defines marshal-methods and can be used with PStore
  # @see DefaultSorter
  class SortedArray < Array

    # @params [Array] args the first argument is a Sorter-object
    # @example
    #     my_array = SortedArray.new( DefaultSorter.new(:foo) )
    #     my_array << AnyClassWhichSupportsFoo.new(1)
    #     my_array << AnyClassWhichSupportsFoo.new(3)
    #     my_array << AnyClassWhichSupportsFoo.new(2)
    #     # my_array.map(&:foo) => 1,2,3
    # @see DefaultSorter
    # @see Array
    def initialize *args
      @sorter = args.shift
      super
    end

    # @see Array
    def push *other
      super
      @sorter.sort(self)
    end

    # @see Array
    def unshift other
      super
      @sorter.sort(self)
    end

    # @see Array
    def << other
      push *other
      @sorter.sort(self)
    end

    protected

    # @return [Array] - Sorter-object or nil, [...values...]
    def marshal_dump
      [@sorter ? @sorter.marshal_dump : nil, to_a]
    end

    # Initialize sorter and read in data
    # @param [Array] array - _sorter, [..entries..]
    def marshal_load array
      _sorter, _data = *array
      if _sorter
        initialize_sorter _sorter
        push *_data if _data
      end
    end

    private

    def initialize_sorter args
      @sorter = args.shift.new *args
    end

  end
end
