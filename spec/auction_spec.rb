require './lib/auction'
require './lib/attendee'
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

  context 'Bidding' do
    before(:each) do
      @auction = Auction.new
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')
      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)
    end

    it 'can has unpopular items' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)

      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])

      @item3.add_bid(@attendee2, 15)

      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end

    it 'has items with bids' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.items_with_bids).to eq([@item1, @item3, @item4])
    end

    it 'can have potential revenue' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.potential_revenue).to eq(87)
    end

    it 'has a list of bidders' do
      @item1.add_bid(@attendee1, 20)
      @item1.add_bid(@attendee2, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.bidders).to eq(['Megan', 'Bob', 'Mike'])
    end

    it 'has bidder info' do
      @item1.add_bid(@attendee1, 20)
      @item1.add_bid(@attendee2, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expected = {
        @attendee1 => {budget: 50, items: [@item1]},
        @attendee2 => {budget: 75, items: [@item1, @item3]},
        @attendee3 => {budget: 100, items: [@item4]}
      }
      expect(@auction.bidder_info).to eq(expected)
    end
  end
end