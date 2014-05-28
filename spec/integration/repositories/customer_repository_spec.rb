require 'spec_helper'

describe CustomerRepository do
  let(:repo) { CustomerRepository.new }
  let(:customer) { Customer.new(name: 'John Johnes', email: 'john@example.com') }

  describe 'adding a user' do
    it 'increments the number of customer records' do
      expect { repo.add(customer) }.to change { repo.all.size }.by(1)
    end

    it 'sets the user model instance id' do
      repo.add(customer)
      expect(customer.id).to eq(1)
    end
  end

  describe 'adding a customer and retrieving it' do
    before do
      added_customer = repo.add(customer)
      @found_customer = repo.find_by_id(added_customer.id)
    end

    it 'returns a model object with the same attributes' do
      expect(@found_customer.attributes).to eq(customer.attributes)
    end
  end
end
