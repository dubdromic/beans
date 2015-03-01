require 'spec_helper'

describe Beans::UseCases::Bean::BeanFetcher do
  subject { described_class.call(id) }

  let(:id) { nil }
  let!(:beans) do
    [
      Beans.add_bean(1, 2, 3),
      Beans.add_bean(1, 2, 3)
    ]
  end

  context 'no id specified' do
    it 'returns all beans in the repo' do
      expect(subject.count).to eq(2)
      expect(subject).to eq(beans)
    end
  end

  context 'id specified' do
    let(:id) { beans[1].id }

    it 'returns the specified bean' do
      expect(subject).to eq(beans[1])
    end
  end
end
