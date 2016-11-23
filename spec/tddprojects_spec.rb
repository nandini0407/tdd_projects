require 'tddprojects'
require 'rspec'

describe Array do

  describe '#my_uniq' do
    subject(:arr) { Array.new([1, 2, 1, 3, 3]) }

    it 'should receive an array' do
      expect(arr).to be_a(Array)
    end
    it 'should return an array' do
      expect(arr.my_uniq).to be_a(Array)
    end
    it 'should return a unique array' do
      expect(arr.my_uniq).to eq([1, 2, 3])
    end
    it 'should return an empty array if empty array is given' do
      expect([].my_uniq).to be_empty
    end
    it 'should return unique elements in same order as given array' do
      expect(arr.my_uniq).to eq([1, 2, 3])
    end
  end

  describe '#two_sum' do
    subject(:arr) { [-1, 0, 2, -2, 1] }

    it 'should receive an array' do
      expect(arr).to be_a(Array)
    end

    it 'should return an array' do
      expect(arr.two_sum).to be_a(Array)
    end

    it 'return pairs of indices that sum to zero' do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end

    it 'returns pairs of indices sorted' do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end

  end

  describe '#my_transpose' do

    subject(:matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

    it 'should receive an array' do
      expect(matrix).to be_a(Array)
    end

    it 'should return an array' do
      expect(matrix.my_transpose).to be_a(Array)
    end

    it 'should receive a two dimensional array' do
      expect(matrix.all? { |el| el.is_a?(Array) }).to be_truthy
    end
    it 'should return a two dimensional array' do
      expect(matrix.my_transpose.all? { |el| el.is_a?(Array) }).to be_truthy
    end
    it 'should return a transposed matrix' do
      expect(matrix.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end

  describe '#stock_picker' do
    subject(:prices) { [12, 14, 25, 11, 50, 4, 25, 100, 2] }

    it 'should accept an array' do
      expect(prices).to be_a(Array)
    end
    it 'should return an array of two indices' do
      expect(prices.stock_picker).to be_a(Array)
      expect(prices.stock_picker.length).to eq(2)
    end
    it 'should return a buy index that is before a sell index' do
      days = prices.stock_picker
      expect(days[0]).to be < days[1]
    end
    it 'should return the largest possible profit margin' do
      expect(prices.stock_picker).to eq([5, 7])
    end
  end
end

describe TowersOfHanoi do
  subject(:hanoi) { TowersOfHanoi.new }

  describe '#initialize' do
    it 'starts with two dimensional array' do
      expect(hanoi.stacks.all? { |el| el.is_a?(Array) }).to be_truthy
    end
    it 'starts with all discs in first tower' do
      expect(hanoi.stacks[0]).to eq([3, 2, 1])
      expect(hanoi.stacks[1]).to be_empty
      expect(hanoi.stacks[2]).to be_empty
    end
    it 'starts with all discs in descending order' do
      expect(hanoi.stacks[0]).to eq([3, 2, 1])
    end
  end

  describe '#move' do
    before(:each) { hanoi.move(0, 1) }
    it 'removes last element from from_stack' do
      expect(hanoi.stacks[0]).to eq([3, 2])
    end
    it 'adds to to_stack at the end' do
      expect(hanoi.stacks[1]).to eq([1])
    end
    it 'raises error if moving disc is larger than top of to_stack' do
      expect { hanoi.move(0, 1) }.to raise_error("NOOOOOOO")
    end
  end

  describe '#won?' do

    let(:win) { TowersOfHanoi.new([[], [3, 2, 1], []]) }
    let(:lose) { TowersOfHanoi.new([[3], [2], [1]]) }
    let(:false_win) { TowersOfHanoi.new([[3, 2, 1], [], []]) }
    let(:fake_win) { TowersOfHanoi.new([[], [1, 2, 3], []]) }

    it 'checks that all discs are in one tower' do
      expect(win.won?).to be_truthy
      expect(lose.won?).to be_falsey
    end
    it 'checks that first tower is empty' do
      expect(false_win.won?).to be_falsey
    end
    it 'checks that all discs are in descending order' do
      expect(fake_win.won?).to be_falsey
    end
  end
end
