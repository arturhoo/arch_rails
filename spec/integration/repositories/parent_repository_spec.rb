require 'spec_helper'

describe ParentRepository do
  let(:repo) { ParentRepository.new }
  let(:parent) { Parent.new(name: 'John Johnes', email: 'john@example.com') }

  describe 'adding a user' do
    it 'increments the number of parent records' do
      expect { repo.add(parent) }.to change { repo.all.size }.by(1)
    end

    it 'sets the user model instance id' do
      repo.add(parent)
      expect(parent.id).to eq(1)
    end
  end
end
