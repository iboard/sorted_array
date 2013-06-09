require 'spec_helper'

describe SortedArray::DefaultSorter do

  let(:sorter) { SortedArray::DefaultSorter.new(:foo) }
  let(:items) { [
    OpenStruct.new(foo: 1),
    OpenStruct.new(foo: 3),
    OpenStruct.new(foo: 2)
  ] }
  let(:sorted) { items.sort{|a,b|a.foo <=> b.foo} }

  it 'initialize with a sort-method' do
    expect(sorter.method).to eq(:foo)
  end

  it 'sorts an array by a given sort-method' do
    expect(sorter.sort(items)).to eq(sorted)
  end

  it 'stores the method-name to a PStore' do
    sorter.should_receive(:marshal_dump)
    PStore.new(SORTER_TEST_STORE).transaction do |s|
      s[:sorter] = sorter
    end
  end

  it 'loads the method-name from a PStore' do
    sorter.should_receive(:marshal_load)
    PStore.new(SORTER_TEST_STORE).transaction do |s|
      s[:sorter]
    end
  end
end
