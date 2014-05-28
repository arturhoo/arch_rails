require 'spec_helper'

describe CustomerRepository do
  let(:repo) { CustomerRepository.new }

  subject { repo }

  it { should respond_to :all }
  it { should respond_to :add }
  it { should respond_to :find_by_id }

  describe '#add' do
    before do
      @invalid_customer = double('invalid_customer', valid?: false)
      @valid_customer = double(
        'valid_customer',
        valid?: true,
        attributes: { name: 'John Johnes', email: 'john@example.com' }
      )
      allow(@valid_customer).to receive(:id=)
    end

    context 'given an invalid customer' do
      it 'does not add the customer' do
        expect { repo.add(@invalid_customer) }.to raise_error
      end
    end

    context 'given a valid customer' do
      it 'adds the customer' do
        expect { repo.add(@valid_customer) }.not_to raise_error
      end
    end
  end
end
