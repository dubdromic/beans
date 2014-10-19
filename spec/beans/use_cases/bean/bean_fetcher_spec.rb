require 'spec_helper'

describe Beans::UseCases::Bean::BeanFetcher do
  subject { described_class.call }

  let!(:beans) do
    [
      Beans::UseCases::Bean::BeanAdder.call(1, 2, 3),
      Beans::UseCases::Bean::BeanAdder.call(1, 2, 3)
    ]
  end

  it 'returns all beans in the repo' do
    expect(subject).to eq(beans)
  end
end
