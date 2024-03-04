# Ruby code for string calculator through monkey patching

class String
  def add_numbers
    return 0 if self.empty?
    numbers = get_numbers
    check_negatives(numbers)
    numbers.reduce(0, :+)
  end

  private

  def get_numbers
    raise StandardError, "invalid input" if ends_with_newline?
    delimiter, numbers_string = extract_delimiter_and_numbers
    numbers = numbers_string.split(delimiter).map(&:to_i)
  end

  def extract_delimiter_and_numbers
    delimiter, numbers_string = if start_with?("//")
      [self[2], split("\n", 2).last]
    else
      [/[\n,]/, self]
    end
  end

  def check_negatives(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise StandardError, "negative numbers not allowed: #{negatives.join(',')}" if negatives.any?
  end

  def ends_with_newline?
    end_with?(",\n")
  end
end
