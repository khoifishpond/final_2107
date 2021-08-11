require './lib/attendee'
require 'rspec'

describe Attendee do
  context 'Attributes' do
    before(:each) do
      @attendee = Attendee.new({name: 'Megan', budget: '$50'})
    end
    
    it 'exists' do
      expect(@attendee).to be_a(Attendee)
    end

    it 'has a name' do
      expect(@attendee.name).to eq('Megan')
    end

    it 'has a budget' do
      expect(@attendee.budget).to eq(50)
    end
  end
end