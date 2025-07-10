require_relative '../lib/solution'

describe Solution do
  subject { described_class.new }
  let(:nums) { [-1, 0, 3, 5, 9, 12] }

  it 'finds the value in the middle of the array' do
    expect(subject.search(nums, 9)).to eq(4)
  end

  it 'finds a value in the left half of the array' do
    expect(subject.search(nums, 0)).to eq(1)
  end

  it 'finds a value in the right half of the array' do
    expect(subject.search(nums, 12)).to eq(5)
  end

  it 'returns -1 for a value not in the array' do
    expect(subject.search(nums, 2)).to eq(-1)
  end

  it 'returns -1 for an empty array' do
    expect(subject.search([], 1)).to eq(-1)
  end

  it 'returns -1 for a single element array when the element does not match' do
    expect(subject.search([1], 2)).to eq(-1)
  end

  it 'returns the index for a single element array when the element matches' do
    expect(subject.search([1], 1)).to eq(0)
  end
end
