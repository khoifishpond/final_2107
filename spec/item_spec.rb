require './lib/item'
require 'rspec'

describe Item do
  context 'Attributes' do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
    end
    
    it 'exists' do
      expect(@item1).to be_a(Item)
    end

    it 'has a name' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
    end
  end
end