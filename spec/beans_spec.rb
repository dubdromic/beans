require 'spec_helper'

describe Beans do
  describe '.default_store' do
    subject { described_class.default_store(store) }

    let(:store) { double }

    it 'calls Repository.default=' do
      expect(Beans.repo).to receive(:default=).with(store)
      subject
    end
  end

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
