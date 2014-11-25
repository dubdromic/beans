require 'spec_helper'

describe Beans::UseCases::Brands::BrandAdder do
  subject { described_class.call(name) }

  let(:name) { 'Test Brand' }

  it 'adds a brand to the repo' do
    expect(Beans.repo.for(:brand)).to receive(:save)
    subject
  end

  it 'returns the new brand' do
    expect(subject).to be_a_kind_of(Beans::Entities::Brand)
    expect(subject.name).to eq(name)
  end
end
