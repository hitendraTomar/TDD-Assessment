# TDD without monkey patch for calculator_spec.rb
require 'calculator.rb'

RSpec.describe Calculator do
  describe '#add_numbers' do
    before do
      @calculator = Calculator.new
    end

    context 'when input is an empty string' do
      it 'returns 0' do
        expect(@calculator.add_numbers("")).to eq(0)
      end
    end

    context 'when input is contains a single number' do
      it 'returns the number' do
        expect(@calculator.add_numbers("1")).to eq(1)
      end
    end

    context 'when input contains multiple numbers separated by commas' do
      it 'returns the sum of the numbers' do
        expect(@calculator.add_numbers("1,5,6")).to eq(12)
      end
    end

    context 'when string contains negative numbers' do
      it 'raises an exception with negative numbers' do
        expect { @calculator.add_numbers("1,-2,3,-4") }.to raise_error(StandardError, "negative numbers not allowed: -2,-4")
      end
    end

    context 'when input contains a custom delimiter' do
      it 'returns the sum of the numbers include in the string' do
        expect(@calculator.add_numbers("//;\n1;2;3")).to eq(6)
      end
    end

    context 'when string contains numbers separated by spaces' do
      it 'returns the sum of the numbers' do
        expect(@calculator.add_numbers("1, 5")).to eq(6)
      end
    end

    context 'when input contains new line at the end' do
      it 'raises an exception with invalid input' do
        expect { @calculator.add_numbers("1,\n") }.to raise_error(StandardError, "invalid input")
      end
    end
  end
end
