# SortedArray

The gem is providing a class `SortedArray` which keeps sorted
after adding new items. When initializing a `SortedArray` you chose
a Sorter which must have a method `:sort`

Sorter-classes `DefaultSorter` and `ReverseSorter` are included.

The included `DefaultSorter` sorts a list of Objects by a given method-name.
The included `ReverseSorter` sorts a list of Objects by a given method-name and then reverses it.


## Installation

  * see [RubyGems](http://rubygems.org/gems/sorted_array)
  * see [Github](https://github.com/iboard/sorted_array#readme)

Add this line to your application's Gemfile:

    gem 'sorted_array' 

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sorted_array
    
Run Tests

_If you clone from github you can run the following tasks:_


    $ git clone git://github.com/iboard/sorted_array.git
    $ cd sorted_array
    $ bundle               # update/install the bundle
    $ rake                 # run all tests
    $ rspec spec/          # run all specs manually
    $ guard                # start guard

## Documentation

    $ yard
    $ open doc/index.html  # on Mac OS X

A copy of the YARDocumentation can be found at
[iboard.cc - yardoc](http://dav.iboard.cc/container/sorted_array_doc/)

And a copy of the last coverage-report is at
[iboard.cc - coverage](http://dav.iboard.cc/container/sorted_array_coverage/)

## Usage-example

    data = [
      OpenStruct.new( foo: 1 ),
      OpenStruct.new( foo: 3 ),
      OpenStruct.new( foo: 2 )
    ]
    keep_sorted   = SortedArray.new( DefaultSorter.new(:foo), data )
    keep_reversed = SortedArray.new( ReverseSorter.new(:foo), data )
    keep_sorted   << OpenStruct.new( foo: 0 )
    keep_reversed << OpenStruct.new( foo: 0 )
    
    # data.map(&:foo) => [1,3,2]
    # keep_sorted.map(&:foo) => [0,1,2,3]
    # keep_reversed.map(&:foo) => [3,2,1,0]
    
## Persistent

_SortedArray_ defines a `marshal_load` and `marshal_dump` method and
can be used in a `PStore`

Example:

    # assumes the previous example was executed before
     
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
