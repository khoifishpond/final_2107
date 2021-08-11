class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.select do |item|
      item.bids.empty?
    end
  end

  def items_with_bids
    @items.select do |item|
      item.bids.empty? == false
    end
  end

  def potential_revenue
    items_with_bids.sum do |item|
      item.current_high_bid
    end
  end

  def bidders
    bidder_names = []
    items_with_bids.each do |item|
      item.bids.each_key do |attendee|
        bidder_names << attendee.name
      end
    end
    bidder_names.uniq
  end

  def bidder_info
    info = {}
    items_with_bids.each do |item|
      item.bids.each_key do |bidder|
        info[bidder] ||= {budget: bidder.budget, items: []}
        info[bidder][:items] << item
      end
    end
    info
  end
end