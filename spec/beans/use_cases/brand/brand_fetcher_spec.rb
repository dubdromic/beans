require 'spec_helper'

describe Beans::UseCases::Brand::BrandFetcher do
  subject { described_class.call(id) }

  let(:id) { nil }
  let!(:brands) do
    [
      Beans.add_brand('Test Brand'),
      Beans.add_brand('Test Brand 2')
    ]
  end

  context 'no id specified' do
    it 'returns all brands in the repo' do
      expect(subject.count).to eq(2)
      expect(subject).to eq(brands)
    end
  end

  context 'id specified' do
    let(:id) { brands[1].id }

    it 'returns the specified brand' do
      expect(subject).to eq(brands[1])
    end
  end
end
