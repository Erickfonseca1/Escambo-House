require 'rails_helper'

RSpec.describe Exchange, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      exchange = Exchange.new(attribute1: 'value1', attribute2: 'value2')
      expect(exchange).to be_valid
    end

    it 'is not valid without attribute1' do
      exchange = Exchange.new(attribute2: 'value2')
      expect(exchange).to_not be_valid
    end

    it 'is not valid without attribute2' do
      exchange = Exchange.new(attribute1: 'value1')
      expect(exchange).to_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:items) }
  end

  describe 'custom methods' do
    before do
      @exchange = Exchange.create(attribute1: 'value1', attribute2: 'value2')
    end

    it 'calculates the total value of items' do
      item1 = @exchange.items.create(value: 10)
      item2 = @exchange.items.create(value: 20)
      expect(@exchange.total_value).to eq(30)
    end
  end
end