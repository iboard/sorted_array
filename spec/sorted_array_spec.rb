require 'spec_helper'
require 'ostruct'
require 'pstore'

describe SortedArray::SortedArray do

  context 'with two objects and the DefaultSorter' do

    let(:items) { [ OpenStruct.new(foo: 'baz'), OpenStruct.new(foo: 'bar') ] }
    let(:sorted) { items.reverse }
    let(:sorter) { SortedArray::DefaultSorter.new( :foo ) }
    let(:array)  { SortedArray::SortedArray.new(sorter)   }

    it 'sorts objects after push' do
      expect(array.push *items).to eq(sorted)
    end

    it 'sorts objects after <<' do
      expect(array << items).to eq(sorted)
    end

    it 'sorts objects after unshift' do
      items.each { |item| array.unshift(item) }
      expect(array).to eq(sorted)
    end


    describe 'Persists to a PStore' do

      let(:store) { PStore.new(ARRAY_TEST_STORE) }

      it 'stores to a PStore' do
        expect{ store.transaction { |ps| ps[:array] = array } }.not_to raise_error
      end

      it 'reads from a PStore' do
        loaded_array = nil
        array.push *items
        store.transaction do |ps|
          ps[:array] = array
        end
        store.transaction(true) do |ps| 
          loaded_array = ps[:array] 
        end
        expect(loaded_array).to eq(sorted)
      end

    end
  end
end
