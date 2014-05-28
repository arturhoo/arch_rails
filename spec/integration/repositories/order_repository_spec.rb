require 'spec_helper'

describe OrderRepository do
  let(:repo) { OrderRepository.new }
  let(:order) { Order.new(value: 100, customer_id: 1) }

  describe 'adding an order' do
    it 'increments the number of order records' do
      expect { repo.add(order) }.to change { repo.all.size }.by(1)
    end

    it 'sets the order model instance id' do
      repo.add(order)
      expect(order.id).to eq(1)
    end
  end

  describe 'adding an order and retrieving it' do
    before do
      added_order = repo.add(order)
      @found_order = repo.find_by_id(added_order.id)
    end

    it 'returns a model object with the same attributes' do
      expect(@found_order.attributes).to eq(order.attributes)
    end
  end
end
