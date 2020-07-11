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
  end
end
