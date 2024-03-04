# Ruby code for string calculator through monkey patching

class Calculator
  def add_numbers(input)
    return 0 if input.empty?
    numbers = get_numbers(input)
    check_negatives(numbers)
    numbers.reduce(0, :+)
  end

  private

  def get_numbers(input)
    raise StandardError, "invalid input" if ends_with_newline?(input)
    delimiter, numbers_string = extract_delimiter_and_numbers(input)
    numbers = numbers_string.split(delimiter).map(&:to_i)
  end

  def extract_delimiter_and_numbers(input)
    delimiter, numbers_string = if input.start_with?("//")
      [input[2], input.split("\n", 2).last]
    else
      [/[\n,]/, input]
    end
  end

  def check_negatives(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise StandardError, "negative numbers not allowed: #{negatives.join(',')}" if negatives.any?
  end

  def ends_with_newline?(input)
    input.end_with?(",\n")
  end
end
