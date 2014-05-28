require 'spec_helper'

describe Order do
  let(:order) { Order.new(value: 'John Johnes', customer_id: 1) }
  subject { order }

  it { should respond_to :id }
  it { should respond_to :value }
  it { should respond_to :customer_id }
  it { should be_valid }

  context 'without value' do
    before { order.value = nil }
    it { should_not be_valid }
  end

  context 'without customer_id' do
    before { order.customer_id = nil }
    it { should_not be_valid }
  end

  context 'without id' do
    before { order.id = nil }
    it { should be_valid }
  end
end
