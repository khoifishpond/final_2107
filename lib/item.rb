class Item
  attr_reader :name, :bids, :is_open

  def initialize(name)
    @name = name
    @bids = {}
    @is_open = true
  end

  def add_bid(attendee, bid)
    if @is_open == true
      @bids[attendee] = bid
    end
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @is_open = false
  end
end