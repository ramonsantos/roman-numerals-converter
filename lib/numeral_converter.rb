# frozen_string_literal: true

module NumeralConverter
  class << self
    def from_hindu_arabic_to_roman(numerals)
      return invalid_hindu_arabic_message unless hindu_arabic_numerals?(numerals)

      number = numerals.to_i

      if (1..3999).cover?(number)
        convert_to_roman(number)
      else
        invalid_hindu_arabic_message
      end
    end

    def from_roman_to_hindu_arabic(numerals)
      return invalid_roman_message if numerals.nil? || numerals.empty?

      numbers = numerals.strip.match(roman_regex)

      return invalid_roman_message if numbers.nil?

      convert_to_hindu_arabic(numbers)
    end

    private

    def convert_to_roman(number)
      unit, tens, hundreds, thousands = number.digits

      "#{
        build_roman_numeral(thousands, 'M')
      }#{
        build_roman_numeral(hundreds, 'C', 'D', 'M')
      }#{
        build_roman_numeral(tens, 'X', 'L', 'C')
      }#{
        build_roman_numeral(unit, 'I', 'V', 'X')
      }"
    end

    def build_roman_numeral(number, one, five = nil, next_number_class = nil)
      if (1..3).cover?(number)
        one * number
      elsif number == 4
        "#{one}#{five}"
      elsif number == 5
        five
      elsif (6..8).cover?(number)
        "#{five}#{one * (number - 5)}"
      elsif number == 9
        "#{one}#{next_number_class}"
      end
    end

    def hindu_arabic_numerals?(numerals)
      numerals&.match(/^\d+$/)
    end

    def invalid_hindu_arabic_message
      'Invalid Hindu-Arabic Numerals'
    end

    def convert_to_hindu_arabic(numbers)
      [
        [numbers[:thousands], 'M', nil, 1000],
        [numbers[:hundreds],  'C', 'D', 100],
        [numbers[:tens],      'X', 'L', 10],
        [numbers[:unit],      'I', 'V', 1]
      ].reduce(0) do |sum, numeral|
        sum + build_hindu_arabic_digit(numeral[0], numeral[1], numeral[2]) * numeral[3]
      end
    end

    def roman_regex
      %r{
        ^
        (?<thousands>M{0,3})
        (?<hundreds>C[MD]|D?C{0,3})
        (?<tens>X[CL]|L?X{0,3})
        (?<unit>I[XV]|V?I{0,3})
        $
      }x
    end

    def build_hindu_arabic_digit(roman_number, one, five = nil)
      if roman_number.empty?
        0
      elsif roman_number.match(/^#{one}{1,3}$/)
        roman_number.size
      elsif roman_number == "#{one}#{five}"
        4
      elsif roman_number.match(/^#{five}#{one}{0,3}$/)
        roman_number.size + 4
      else
        9
      end
    end

    def invalid_roman_message
      'Invalid Roman Numerals'
    end
  end
end
