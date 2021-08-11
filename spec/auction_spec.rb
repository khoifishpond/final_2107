require './lib/auction'
require './lib/item'
require 'rspec'

describe Auction do
  context 'Attributes' do
    before(:each) do
      @auction = Auction.new
    end
    
    it 'exists' do
      expect(@auction).to be_a(Auction)
    end

    it 'starts with no items' do
      expect(@auction.items).to eq([])
    end
  end

  context 'Items' do
    before(:each) do
      @auction = Auction.new
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
    end
    
    it 'can add items' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.items).to eq([@item1, @item2])
    end

    it 'can list item names' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end
end