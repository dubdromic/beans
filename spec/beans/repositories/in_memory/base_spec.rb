require 'spec_helper'

TestItem = Struct.new(:id)

describe Beans::Repositories::InMemory::Base do
  subject(:repo) { described_class.new }

  describe '#all' do
    subject { repo.all }

    let(:items) { [TestItem.new, TestItem.new] }

    before do
      repo.save(items[0])
      repo.save(items[1])
    end

    it 'returns all available items' do
      expect(subject).to eq([items[0], items[1]])
    end
  end

  describe '#find' do
    subject { repo.find(2) }

    let(:items) { [TestItem.new(1), TestItem.new(2), TestItem.new(3)] }

    before do
      repo.save(items[0])
      repo.save(items[1])
      repo.save(items[2])
    end

    it 'returns the item specified by ID' do
      expect(subject).to eq(items[1])
    end
  end

  describe '#save' do
    subject { repo.save(item) }

    let(:item) { TestItem.new }

    it 'adds the item to the repo' do
      subject
      expect(repo.all.size).to eq(1)
    end

    it 'returns the saved item' do
      expect(subject).to eq(item)
    end

    it 'assings an ID to the item' do
      expect(subject.id).to eq(1)
    end
  end

  describe '#delete_all' do
    subject { repo.delete_all }

    let(:item) { TestItem.new }

    before { repo.save item }

    it 'removes all items' do
      expect(repo.all).to eq([item])
      subject
      expect(repo.all).to eq([])
    end
  end
end
