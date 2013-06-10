require 'spec_helper'
require 'pstore'

describe SortedArray::ReverseSorter do

  let(:sorter) { SortedArray::ReverseSorter.new(:foo) }
  let(:items) { [
    OpenStruct.new(foo: 1),
    OpenStruct.new(foo: 3),
    OpenStruct.new(foo: 2)
  ] }
  let(:reversed) { items.sort{|a,b|a.foo <=> b.foo}.reverse }
  let(:store)  { PStore.new(SORTER_TEST_STORE) }

  it 'sorts and reverse an array by a given sort-method' do
    expect(sorter.sort(items)).to eq(reversed)
  end

  it 'stores the method-name to a PStore' do
    sorter.should_receive(:marshal_dump)
    store.transaction do |s|
      s[:sorter] = sorter
    end
  end

  it 'loads the method-name and propper class from a PStore' do
    _s = nil
    store.transaction(true) { |r| _s = r[:sorter] }
    expect(_s).to be_a SortedArray::ReverseSorter
    expect(_s.method).to eq(:to_s)
  end
end
