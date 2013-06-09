module SortedArray

  # Sorts by comparing of :field  a <=> b.
  #
  # Descend your Sorter from this class. It must at least define a
  # method 'sort'.
  # @example
  #   class Foo
  #     def initialize(_bar)
  #       @bar = _bar
  #     end
  #     def bar
  #       @bar
  #     end
  #   end
  #   s = DefaultSorter.new(:bar)
  #   a = SortedArray(s, Foo.new(1), Foo.new(3), Foo.new(2))
  #   # => Foo(1), Foo(2), Foo(3)
  # @see SortedArray
  class DefaultSorter

    attr_reader :method

    # @param [String] _method - the method to be used while sorting.
    def initialize(_method)
      @method = _method
    end

    # Sort the given object.
    # @abstract Overwrite this method in descendants
    # to sort your objects for your needs
    # @param [Object] what - what must provice a method sort! and :method
    # @return [Object]
    def sort(object)
      object.sort! { |a,b| a.send(@method) <=> b.send(@method) }
    end

    # @return [Array] - Classname, methodname
    def marshal_dump
      [ self.class, @method ]
    end

    # @param [Array] array - _classname,[..entries..]
    def marshal_load array
      @method = array.last
    end

  end

end
