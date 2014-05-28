require 'spec_helper'

describe ParentRepository do
  let(:repo) { ParentRepository.new }

  subject { repo }

  it { should respond_to :all }
  it { should respond_to :add }
  it { should respond_to :find_by_id }

  describe '#add' do
    before do
      @invalid_parent = stub('invalid_parent', valid?: false)
      @valid_parent = stub(
        'valid_parent',
        valid?: true,
        attributes: { name: 'John Johnes', email: 'john@example.com' }
      )
      allow(@valid_parent).to receive(:id)
    end

    context 'given an invalid Parent' do
      it 'does not add the parent' do
        expect { repo.add(@invalid_parent) }.to raise_error
      end
    end

    context 'given a valid Parent' do
      it 'adds the parent' do
        expect { repo.add(@valid_parent) }.not_to raise_error
      end
    end
  end
end
