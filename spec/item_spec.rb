require './lib/item'
require './lib/attendee'
require 'rspec'

describe Item do
  context 'Attributes' do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
    end
    
    it 'exists' do
      expect(@item1).to be_a(Item)
    end

    it 'has a name' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
    end

    it 'is open for bidding' do
      expect(@item1.is_open).to eq(true)
    end
  end

  context 'Bids' do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    end

    it 'starts with no bids' do
      expect(@item1.bids).to eq({})
    end

    it 'can add bids' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
    end

    it 'has a highest bid' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      expect(@item1.current_high_bid).to eq(22)
    end

    it 'can close bidding' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})

      @item1.close_bidding
      @item1.add_bid(@attendee3, 70)

      expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
    end
  end
end