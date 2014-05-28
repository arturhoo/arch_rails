require 'spec_helper'

describe 'Customer' do
  let(:customer) { Customer.new(name: 'John Johnes', email: 'john@example.com') }
  subject { customer }

  it { should respond_to :id }
  it { should respond_to :name }
  it { should respond_to :email }
  it { should be_valid }

  context 'without name' do
    before { customer.name = nil }
    it { should_not be_valid }
  end

  context 'without email' do
    before { customer.email = nil }
    it { should_not be_valid }
  end

  context 'without id' do
    before { customer.id = nil }
    it { should be_valid }
  end
end
