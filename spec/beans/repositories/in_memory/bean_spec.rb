require 'spec_helper'

TestBean = Struct.new(:id)

describe Beans::Repositories::InMemory::Bean do
  subject(:repo) { described_class.new }

  describe '#all' do
    subject { repo.all }

    let(:beans) { [TestBean.new, TestBean.new] }

    before do
      repo.save(beans[0])
      repo.save(beans[1])
    end

    it 'returns all available beans' do
      expect(subject).to eq([beans[0], beans[1]])
    end
  end

  describe '#find' do
    subject { repo.find(2) }

    let(:beans) { [TestBean.new(1), TestBean.new(2), TestBean.new(3)] }

    before do
      repo.save(beans[0])
      repo.save(beans[1])
      repo.save(beans[2])
    end

    it 'returns the bean specified by ID' do
      expect(subject).to eq(beans[1])
    end
  end

  describe '#save' do
    subject { repo.save(bean) }

    let(:bean) { TestBean.new }

    it 'adds the bean to the repo' do
      subject
      expect(repo.all.size).to eq(1)
    end

    it 'returns the saved bean' do
      expect(subject).to eq(bean)
    end

    it 'assings an ID to the bean' do
      expect(subject.id).to eq(1)
    end
  end
end
