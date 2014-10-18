require 'spec_helper'

describe Beans::Repository do
  subject(:repository) { described_class }

  describe '.register' do
    subject { super().register(type, repo) }

    let(:type) { :test }
    let(:repo) { [1] }

    it 'adds the repo to the repository' do
      subject
      expect(repository.repositories).to eq({ test: [1] })
    end
  end

  describe '.for' do
    subject { super().for(:test) }

    before do
      repository.register(:test, [2])
      repository.register(:another, [3])
    end

    it 'returns the repository for the given type' do
      expect(subject).to eq([2])
    end
  end
end
