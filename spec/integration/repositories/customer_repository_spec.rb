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
end
