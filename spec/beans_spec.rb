require 'spec_helper'

describe Beans do
  describe '.register_repository' do
    subject { described_class.register_repository(type, repository) }

    let(:type) { :test }
    let(:repository) { double }

    it 'calls Repository.register' do
      expect(Beans::Registry).to receive(:register).with(type, repository)
      subject
    end
  end

  describe '.repo' do
    subject { described_class.repo }

    it 'returns the registry' do
      expect(subject).to be(Beans::Registry)
    end
  end

  describe '.add_use_case' do
    subject { described_class.add_use_case(use_case) }

    let(:use_case) { double }

    it 'adds the use case' do
      subject
      expect(described_class.use_cases).to eq([use_case])
    end
  end

  describe 'method missing' do
    context 'a use case responds to the method' do
      subject { described_class.test_use_case(1, 2, 3) }

      let(:use_case_double) { double(test_use_case: [1]) }

      before { described_class.add_use_case(use_case_double) }

      it 'calls the method on that use case' do
        expect(subject).to eq([1])
      end
    end
  end
end
