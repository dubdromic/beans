require 'spec_helper'

describe Beans do
  describe '.register_repository' do
    subject { described_class.register_repository(type, repository) }

    let(:type) { :test }
    let(:repository) { double }

    it 'calls Repository.register' do
      expect(Beans.repo).to receive(:register).with(type, repository)
      subject
    end
  end

  describe '.repo' do
    subject { described_class.repo }

    it 'returns the registry' do
      expect(subject).to be_an_instance_of(Beans::Registry)
    end
  end
end
