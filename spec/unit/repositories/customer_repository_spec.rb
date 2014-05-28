require 'spec_helper'

describe CustomerRepository do
  before do
    @invalid_customer = double('invalid_customer', valid?: false)
    @valid_customer = double(
      'valid_customer',
      valid?: true,
      attributes: { }
    )
    allow(@valid_customer).to receive(:id=)
    allow(@valid_customer).to receive(:kind_of?).and_return { Customer }
  end

  let(:repo) { CustomerRepository.new }

  subject { repo }

  it { should respond_to :all }
  it { should respond_to :add }
  it { should respond_to :find_by_id }

   describe '#all' do
    before do
      repo.add(@valid_customer)
    end

    it 'returns an array' do
      expect(repo.all).to be_kind_of Array
    end

    it 'returns an array of Customers' do
      expect(repo.all.sample).to be_kind_of Customer
    end
  end

  describe '#add' do
    context 'given an invalid customer' do
      it 'does not add the customer' do
        expect { repo.add(@invalid_customer) }.to raise_error
      end
    end

    context 'given a valid customer' do
      it 'adds the customer' do
        expect { repo.add(@valid_customer) }.not_to raise_error
      end

      it 'returns a Customer object' do
        expect(repo.add(@valid_customer)).to be_kind_of Customer
      end
    end
  end

  describe '#find_by_id' do
    before do
      allow(@valid_customer).to receive(:id) { 1 }
      repo.add(@valid_customer)
    end

    it 'returns a Customer object' do
      expect(repo.find_by_id(1)).to be_kind_of Customer
    end

    it 'returns the correct customer' do
      customer = repo.find_by_id 1
      expect(customer.id).to eq(1)
    end
  end
end
