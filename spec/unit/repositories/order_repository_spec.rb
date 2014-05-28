require 'spec_helper'

describe OrderRepository do
  before do
    @invalid_order = double('invalid_order', valid?: false)
    @valid_order = double(
      'valid_order',
      valid?: true,
      attributes: { value: 100, customer_id: 1 }
    )
    allow(@valid_order).to receive(:id=)
    allow(@valid_order).to receive(:kind_of?).and_return { Order }
  end

  let(:repo) { OrderRepository.new }

  subject { repo }

  it { should respond_to :all }
  it { should respond_to :add }
  it { should respond_to :find_by_id }

  describe '#add' do
    before do
      repo.add(@valid_order)
    end

    it 'returns an array' do
      expect(repo.all).to be_kind_of Array
    end

    it 'returns an array of Orders' do
      expect(repo.all.sample).to be_kind_of Order
    end
  end

  describe '#add' do
    context 'given an invalid customer' do
      it 'does not add the customer' do
        expect { repo.add(@invalid_order) }.to raise_error
      end
    end

    context 'given a valid customer' do
      it 'adds the customer' do
        expect { repo.add(@valid_order) }.not_to raise_error
      end

      it 'returns a customer object' do
        expect(repo.add(@valid_order)).to be_kind_of Order
      end
    end
  end

  describe '#find_by_id' do
    before do
      allow(@valid_order).to receive(:id) { 1 }
      repo.add(@valid_order)
    end

    it 'returns a customer object' do
      expect(repo.find_by_id(1)).to be_kind_of Order
    end

    it 'returns the correct order' do
      order = repo.find_by_id 1
      expect(order.id).to eq(1)
    end
  end
end
