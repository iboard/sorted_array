require 'spec_helper'
require 'pstore'

describe SortedArray::DefaultSorter do

  let(:sorter) { SortedArray::DefaultSorter.new(:foo) }
  let(:items) { [
    OpenStruct.new(foo: 1),
    OpenStruct.new(foo: 3),
    OpenStruct.new(foo: 2)
  ] }
  let(:sorted) { items.sort{|a,b|a.foo <=> b.foo} }
  let(:store)  { PStore.new(SORTER_TEST_STORE) }

  it 'initialize with a sort-method' do
    expect(sorter.method).to eq(:foo)
  end

  it 'sorts an array by a given sort-method' do
    expect(sorter.sort(items)).to eq(sorted)
  end

  it 'stores the method-name to a PStore' do
    sorter.should_receive(:marshal_dump)
    store.transaction do |s|
      s[:sorter] = sorter
    end
  end

  it 'loads the method-name from a PStore' do
    _s = nil
    store.transaction(true) { |r| _s = r[:sorter] }
    expect(_s).to be_a SortedArray::DefaultSorter
    expect(_s.method).to eq(:to_s)
  end
end
