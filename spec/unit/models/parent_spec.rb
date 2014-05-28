require 'spec_helper'

describe 'Parent' do
  let(:parent) { Parent.new(name: 'John Johnes', email: 'john@example.com') }
  subject { parent }

  it { should respond_to :name }
  it { should respond_to :email }
  it { should be_valid }

  context 'without name' do
    before { parent.name = nil }

    it { should_not be_valid }
  end

  context 'without email' do
    before { parent.email = nil }

    it { should_not be_valid }
  end
end
