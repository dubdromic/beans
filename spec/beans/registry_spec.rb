require 'spec_helper'

describe Beans::Registry do
  subject(:registry) { described_class }

  describe '.register' do
    subject { super().register(type, repo) }

    let(:type) { :test }
    let(:repo) { [1] }

    it 'adds the repo to the repository' do
      subject
      expect(registry.repositories).to include({ test: [1] })
    end
  end

  describe '.for' do
    subject { super().for(:test) }

    before do
      registry.register(:test, [2])
      registry.register(:another, [3])
    end

    it 'returns the repository for the given type' do
      expect(subject).to eq([2])
    end
  end
end
