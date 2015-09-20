require 'spec_helper'

describe Beans::Registry do
  subject(:registry) { described_class.new }

  let(:test_double) { double('test').as_null_object }
  let(:another_double) { double('another').as_null_object }

  describe '.register' do
    subject { super().register(type, repo) }

    let(:type) { :test }
    let(:repo) { test_double }

    it 'adds the repo to the repository' do
      subject
      expect(registry.repositories).to include(test: test_double)
    end
  end

  describe '.for' do
    subject { super().for(:another) }

    context 'type registered' do
      before do
        registry.register(:test, test_double)
        registry.register(:another, another_double)
      end

      it 'returns the repository for the given type' do
        expect(subject).to eq(another_double)
      end
    end

    context 'type not registered' do
      it 'returns the default repository' do
        expect(subject).to be_an_instance_of(Beans::Repositories::InMemory::Base)
      end
    end
  end

  describe '.reset 'do
    subject { super().reset }

    before do
      registry.register(:test, test_double)
      registry.register(:another, another_double)
    end

    it 'resets the default repository' do
      expect { subject }
        .to change { registry.default }.to be_an_instance_of(Beans::Repositories::InMemory::Base)
    end

    it 'calls #delete_all on existing repositories' do
      expect(test_double).to receive(:delete_all)
      expect(another_double).to receive(:delete_all)
      subject
    end

    it 'removes all existing repositories' do
      subject
      expect(registry.repositories).to eq({})
    end
  end

  describe '#repositories' do
    subject { super().repositories }

    before do
      registry.register(:test, test_double)
      registry.register(:another, another_double)
    end

    it 'returns the registered repositories' do
      expect(subject).to eq(test: test_double, another: another_double)
    end
  end
end
