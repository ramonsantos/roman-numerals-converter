# frozen_string_literal: true

require_relative 'numeral_converter/hindu_arabic_to_roman'
require_relative 'numeral_converter/roman_to_hindu_arabic'

module NumeralConverter
  class << self
    include HinduArabicToRoman
    include RomanToHinduArabic
  end
end
