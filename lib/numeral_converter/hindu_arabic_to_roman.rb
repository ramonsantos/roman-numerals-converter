# frozen_string_literal: true

module NumeralConverter
  module HinduArabicToRoman
    def hindu_arabic_to_roman(numerals)
      return invalid_hindu_arabic_message unless hindu_arabic_valid?(numerals)

      convert_to_roman(numerals)
    end

    private

    def convert_to_roman(numerals)
      unit, tens, hundreds, thousands = numerals.digits

      "#{'M' * thousands if thousands}#{
        build_roman_numeral(hundreds, 'C', 'D', 'M')
      }#{
        build_roman_numeral(tens, 'X', 'L', 'C')
      }#{
        build_roman_numeral(unit, 'I', 'V', 'X')
      }"
    end

    def build_roman_numeral(number, one, five = nil, next_number_order = nil)
      return nil if blank_number?(number)
      return "#{one}#{five}" if number == 4
      return "#{one}#{next_number_order}" if number == 9

      "#{five if number >= 5}#{one * (number % 5)}"
    end

    def hindu_arabic_valid?(numerals)
      numerals&.is_a?(Integer) && (1..3999).cover?(numerals)
    end

    def blank_number?(number)
      number.nil? || number.zero?
    end

    def invalid_hindu_arabic_message
      'Invalid Hindu-Arabic Numerals'
    end
  end
end
