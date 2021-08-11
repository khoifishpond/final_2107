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
end