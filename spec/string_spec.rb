# TDD using monkey patch for string_spec.rb
require 'string.rb'

RSpec.describe String do
  describe '#add_numbers' do
    context 'when input is an empty string' do
      it 'returns 0' do
        expect("".add_numbers).to eq(0)
      end
    end

    context 'when input contains a single number' do
      it 'returns the number' do
        expect("1".add_numbers).to eq(1)
      end
    end

    context 'when input contains multiple numbers separated by commas' do
      it 'returns the sum of the numbers' do
        expect("1,2,3,4,5".add_numbers).to eq(15)
      end
    end

    context 'when input contains new lines between numbers' do
      it 'returns the sum of the numbers' do
        expect("1\n2,3".add_numbers).to eq(6)
      end
    end

    context 'when input contains new lines at the end' do
      it 'raises an exception with invalid input' do
        expect { "1,\n".add_numbers }.to raise_error(StandardError, "invalid input")
      end
    end

    context 'when input contains a custom delimiter' do
      it 'returns the sum of the numbers' do
        expect("//;\n1;2;3".add_numbers).to eq(6)
      end
    end

    context 'when input contains negative numbers' do
      it 'raises an exception with negative numbers' do
        expect { "1,-2,3,-4".add_numbers }.to raise_error(StandardError, "negative numbers not allowed: -2,-4")
      end
    end
  end
end
