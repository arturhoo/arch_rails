require 'spec_helper'

describe OrderRepository do
  let(:repo) { OrderRepository.new }

  subject { repo }

  it { should respond_to :all }
  it { should respond_to :add }
  it { should respond_to :find_by_id }

  describe '#add' do
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
end
