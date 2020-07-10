# frozen_string_literal: true

require 'minitest/autorun'
require 'numeral_converter'

class NumeralConverterTest < Minitest::Test
  def test_main
    assert_equal(NumeralConverter.main, :ok)
  end
end
