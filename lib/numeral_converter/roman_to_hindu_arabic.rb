# frozen_string_literal: true

module NumeralConverter
  module RomanToHinduArabic
    def roman_to_hindu_arabic(numerals)
      return invalid_roman_message if numerals.nil? || numerals.empty?

      convert_to_hindu_arabic(numerals.strip.match(roman_regex))
    end

    private

    def convert_to_hindu_arabic(roman_numerals)
      return invalid_roman_message if roman_numerals.nil?

      [
        [roman_numerals[:hundreds], 'C', 'D', 100],
        [roman_numerals[:tens],     'X', 'L', 10],
        [roman_numerals[:unit],     'I', 'V', 1]
      ].reduce(roman_numerals[:thousands].size * 1000) do |sum, numeral|
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

    def build_hindu_arabic_digit(roman_numeral, one, five)
      return 0 if roman_numeral.empty?
      return 4 if roman_numeral == "#{one}#{five}"
      return 9 unless roman_numeral.match(/^#{five}?#{one}{0,3}$/)

      roman_numeral.chars.reduce(0) { |sum, numeral| sum + (numeral == one ? 1 : 5) }
    end

    def invalid_roman_message
      'Invalid Roman Numerals'
    end
  end
end
