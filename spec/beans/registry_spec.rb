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

    before do
      registry.register(:test, test_double)
      registry.register(:another, another_double)
    end

    it 'returns the repository for the given type' do
      expect(subject).to eq(another_double)
    end
  end
end
