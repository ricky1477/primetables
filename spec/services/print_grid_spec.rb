require 'rails_helper'

describe Services::PrintGrid do
  subject { described_class.new }

  describe 'process' do
    let(:n) { nil }
    it 'when no params are provided, an error is triggered' do
      expect { subject.process }.to raise_error(ArgumentError)
    end

    it 'when n is 1' do
      grid = "|       |     2 |\n"\
             "|     2 |     4 |\n"
      expect(subject.process(1)).to eq(grid)
    end

    it 'when n is 2' do
      grid = "|       |     2 |     3 |\n"\
             "|     2 |     4 |     6 |\n"\
             "|     3 |     6 |     9 |\n"
      expect(subject.process(2)).to eq(grid)
    end

    it 'when n is 3' do
      grid = "|       |     2 |     3 |     5 |\n"\
             "|     2 |     4 |     6 |    10 |\n"\
             "|     3 |     6 |     9 |    15 |\n"\
             "|     5 |    10 |    15 |    25 |\n"
      expect(subject.process(3)).to eq(grid)
    end

    it 'when n is 4' do
      grid = "|       |     2 |     3 |     5 |     7 |\n"\
             "|     2 |     4 |     6 |    10 |    14 |\n"\
             "|     3 |     6 |     9 |    15 |    21 |\n"\
             "|     5 |    10 |    15 |    25 |    35 |\n"\
             "|     7 |    14 |    21 |    35 |    49 |\n"
      expect(subject.process(4)).to eq(grid)
    end
  end
end
