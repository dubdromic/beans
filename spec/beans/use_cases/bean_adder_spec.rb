require 'spec_helper'

describe Beans::UseCases::BeanAdder do
  subject { described_class.call(name, region, country) }

  let(:name) { 'Test Bean' }
  let(:region) { 'Lake Toba' }
  let(:country) { 'Sumatra' }

  it 'adds a bean to the repo' do
    expect(Beans::Registry.for(:bean)).to receive(:save)
    subject
  end

  it 'returns the new bean' do
    expect(subject).to be_a_kind_of(Beans::Entities::Bean)
    expect(subject.name).to eq(name)
  end
end
