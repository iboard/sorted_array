# SortedArray

The gem provides a class SortedArray which keeps sorted
with a given Sorter-class after adding new items.

The included DefaultSorter sorts a list of Objects by a
given method-name.

## Installation

Add this line to your application's Gemfile:

    gem 'sorted_array'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sorted_array
    
Run Tests

    $ rake

    # using Guard
    $ guard
    
    # with rspec
    $ rspec spec/
    
Build Documentation

    $ yard
    $ open doc/index.html

## Usage

    data = [
      OpenStruct.new( foo: 1 ),
      OpenStruct.new( foo: 3 ),
      OpenStruct.new( foo: 2 )
    ]
    keep_sorted = SortedArray.new( DefaultSorter.new(:foo), data )
    keep_sorted << OpenStruct.new( foo: 0 )
    
    # data.map(&:foo) => [1,3,2]
    # keep_sorted.map(&:foo) => [0,1,2,3]
    
## Persistent

_SortedArray_ defines a marshal_load and marshal_dump method and
is safe to be used with PStore.

Example:

    store=PStore.new('example.pstore')
    store.transaction do |w|
      w[:data] = keep_sorted
    end
    
    from_disk = []
    store.trasaction(true) do |r|
      from_disk = r[:data]
    end
    
    # from_disk.map(&:foo) => [0,1,2,3]


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

Copyright (c) 2013 Andi Altendorfer

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
