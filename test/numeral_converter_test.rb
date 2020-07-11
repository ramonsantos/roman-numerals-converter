# frozen_string_literal: true

require 'minitest/autorun'
require 'numeral_converter'
require_relative 'support/test_helper'

describe NumeralConverter do
  subject { NumeralConverter }

  describe '#from_hindu_arabic_to_roman' do
    describe 'when invalid numerals' do
      let(:invalid_result) { 'Invalid Hindu-Arabic Numerals' }

      it 'return error message when Hindu-Arabic numerals is nil' do
        expect(subject.from_hindu_arabic_to_roman(nil)).must_equal(invalid_result)
      end

      it 'return error message when Hindu-Arabic numerals is empty' do
        expect(subject.from_hindu_arabic_to_roman('')).must_equal(invalid_result)
      end

      it 'return error message when Hindu-Arabic numerals is zero' do
        expect(subject.from_hindu_arabic_to_roman('0')).must_equal(invalid_result)
      end

      it 'return error message when Hindu-Arabic numerals is bigger then 3999' do
        expect(subject.from_hindu_arabic_to_roman('4000')).must_equal(invalid_result)
      end

      it 'return error message when Hindu-Arabic numerals is negative' do
        expect(subject.from_hindu_arabic_to_roman('-1')).must_equal(invalid_result)
      end

      it 'return error message when Hindu-Arabic numerals has more than four digits' do
        expect(subject.from_hindu_arabic_to_roman('13999')).must_equal(invalid_result)
      end

      it 'return error message when Hindu-Arabic numerals has letter' do
        expect(subject.from_hindu_arabic_to_roman('1z')).must_equal(invalid_result)
        expect(subject.from_hindu_arabic_to_roman('a1')).must_equal(invalid_result)
      end
    end

    describe 'when valid numerals' do
      it { expect(subject.from_hindu_arabic_to_roman('1')).must_equal('I') }
      it { expect(subject.from_hindu_arabic_to_roman('2')).must_equal('II') }
      it { expect(subject.from_hindu_arabic_to_roman('3')).must_equal('III') }
      it { expect(subject.from_hindu_arabic_to_roman('4')).must_equal('IV') }
      it { expect(subject.from_hindu_arabic_to_roman('5')).must_equal('V') }
      it { expect(subject.from_hindu_arabic_to_roman('6')).must_equal('VI') }
      it { expect(subject.from_hindu_arabic_to_roman('7')).must_equal('VII') }
      it { expect(subject.from_hindu_arabic_to_roman('8')).must_equal('VIII') }
      it { expect(subject.from_hindu_arabic_to_roman('9')).must_equal('IX') }
      it { expect(subject.from_hindu_arabic_to_roman('10')).must_equal('X') }
      it { expect(subject.from_hindu_arabic_to_roman('11')).must_equal('XI') }
      it { expect(subject.from_hindu_arabic_to_roman('12')).must_equal('XII') }
      it { expect(subject.from_hindu_arabic_to_roman('13')).must_equal('XIII') }
      it { expect(subject.from_hindu_arabic_to_roman('14')).must_equal('XIV') }
      it { expect(subject.from_hindu_arabic_to_roman('15')).must_equal('XV') }
      it { expect(subject.from_hindu_arabic_to_roman('16')).must_equal('XVI') }
      it { expect(subject.from_hindu_arabic_to_roman('17')).must_equal('XVII') }
      it { expect(subject.from_hindu_arabic_to_roman('18')).must_equal('XVIII') }
      it { expect(subject.from_hindu_arabic_to_roman('19')).must_equal('XIX') }
      it { expect(subject.from_hindu_arabic_to_roman('20')).must_equal('XX') }
      it { expect(subject.from_hindu_arabic_to_roman('21')).must_equal('XXI') }
      it { expect(subject.from_hindu_arabic_to_roman('30')).must_equal('XXX') }
      it { expect(subject.from_hindu_arabic_to_roman('40')).must_equal('XL') }
      it { expect(subject.from_hindu_arabic_to_roman('50')).must_equal('L') }
      it { expect(subject.from_hindu_arabic_to_roman('60')).must_equal('LX') }
      it { expect(subject.from_hindu_arabic_to_roman('70')).must_equal('LXX') }
      it { expect(subject.from_hindu_arabic_to_roman('80')).must_equal('LXXX') }
      it { expect(subject.from_hindu_arabic_to_roman('90')).must_equal('XC') }
      it { expect(subject.from_hindu_arabic_to_roman('98')).must_equal('XCVIII') }
      it { expect(subject.from_hindu_arabic_to_roman('99')).must_equal('XCIX') }
      it { expect(subject.from_hindu_arabic_to_roman('100')).must_equal('C') }
      it { expect(subject.from_hindu_arabic_to_roman('101')).must_equal('CI') }
      it { expect(subject.from_hindu_arabic_to_roman('200')).must_equal('CC') }
      it { expect(subject.from_hindu_arabic_to_roman('300')).must_equal('CCC') }
      it { expect(subject.from_hindu_arabic_to_roman('400')).must_equal('CD') }
      it { expect(subject.from_hindu_arabic_to_roman('500')).must_equal('D') }
      it { expect(subject.from_hindu_arabic_to_roman('600')).must_equal('DC') }
      it { expect(subject.from_hindu_arabic_to_roman('700')).must_equal('DCC') }
      it { expect(subject.from_hindu_arabic_to_roman('800')).must_equal('DCCC') }
      it { expect(subject.from_hindu_arabic_to_roman('900')).must_equal('CM') }
      it { expect(subject.from_hindu_arabic_to_roman('998')).must_equal('CMXCVIII') }
      it { expect(subject.from_hindu_arabic_to_roman('999')).must_equal('CMXCIX') }
      it { expect(subject.from_hindu_arabic_to_roman('1000')).must_equal('M') }
      it { expect(subject.from_hindu_arabic_to_roman('1001')).must_equal('MI') }
      it { expect(subject.from_hindu_arabic_to_roman('2000')).must_equal('MM') }
      it { expect(subject.from_hindu_arabic_to_roman('3000')).must_equal('MMM') }
      it { expect(subject.from_hindu_arabic_to_roman('3333')).must_equal('MMMCCCXXXIII') }
      it { expect(subject.from_hindu_arabic_to_roman('3999')).must_equal('MMMCMXCIX') }
    end
  end

  describe '#from_roman_to_hindu_arabic' do
    describe 'when invalid numerals' do
      let(:invalid_result) { 'Invalid Roman Numerals' }

      it 'return error message when Roman numerals is nil' do
        expect(subject.from_roman_to_hindu_arabic(nil)).must_equal(invalid_result)
      end

      it 'return error message when Roman numerals is empty' do
        expect(subject.from_roman_to_hindu_arabic('')).must_equal(invalid_result)
      end

      it 'return error message when Roman numerals is bigger then MMMCMXCIX' do
        expect(subject.from_roman_to_hindu_arabic('MMMM')).must_equal(invalid_result)
      end

      it 'return error message when Roman numerals is "negative"' do
        expect(subject.from_roman_to_hindu_arabic('-I')).must_equal(invalid_result)
      end

      it 'return error message when Roman numerals has invalid characters' do
        expect(subject.from_roman_to_hindu_arabic('1')).must_equal(invalid_result)
        expect(subject.from_roman_to_hindu_arabic('a')).must_equal(invalid_result)
        expect(subject.from_roman_to_hindu_arabic('i')).must_equal(invalid_result)
      end
    end

    describe 'when valid numerals' do
      it { expect(subject.from_roman_to_hindu_arabic('I')).must_equal(1) }
      it { expect(subject.from_roman_to_hindu_arabic('II')).must_equal(2) }
      it { expect(subject.from_roman_to_hindu_arabic('III')).must_equal(3) }
      it { expect(subject.from_roman_to_hindu_arabic('IV')).must_equal(4) }
      it { expect(subject.from_roman_to_hindu_arabic('V')).must_equal(5) }
      it { expect(subject.from_roman_to_hindu_arabic('VI')).must_equal(6) }
      it { expect(subject.from_roman_to_hindu_arabic('VII')).must_equal(7) }
      it { expect(subject.from_roman_to_hindu_arabic('VIII')).must_equal(8) }
      it { expect(subject.from_roman_to_hindu_arabic('IX')).must_equal(9) }
      it { expect(subject.from_roman_to_hindu_arabic('X')).must_equal(10) }
      it { expect(subject.from_roman_to_hindu_arabic('XI')).must_equal(11) }
      it { expect(subject.from_roman_to_hindu_arabic('XII')).must_equal(12) }
      it { expect(subject.from_roman_to_hindu_arabic('XIII')).must_equal(13) }
      it { expect(subject.from_roman_to_hindu_arabic('XIV')).must_equal(14) }
      it { expect(subject.from_roman_to_hindu_arabic('XV')).must_equal(15) }
      it { expect(subject.from_roman_to_hindu_arabic('XVI')).must_equal(16) }
      it { expect(subject.from_roman_to_hindu_arabic('XVII')).must_equal(17) }
      it { expect(subject.from_roman_to_hindu_arabic('XVIII')).must_equal(18) }
      it { expect(subject.from_roman_to_hindu_arabic('XIX')).must_equal(19) }
      it { expect(subject.from_roman_to_hindu_arabic('XX')).must_equal(20) }
      it { expect(subject.from_roman_to_hindu_arabic('XXI')).must_equal(21) }
      it { expect(subject.from_roman_to_hindu_arabic('XXX')).must_equal(30) }
      it { expect(subject.from_roman_to_hindu_arabic('XL')).must_equal(40) }
      it { expect(subject.from_roman_to_hindu_arabic('L')).must_equal(50) }
      it { expect(subject.from_roman_to_hindu_arabic('LX')).must_equal(60) }
      it { expect(subject.from_roman_to_hindu_arabic('LXX')).must_equal(70) }
      it { expect(subject.from_roman_to_hindu_arabic('LXXX')).must_equal(80) }
      it { expect(subject.from_roman_to_hindu_arabic('XC')).must_equal(90) }
      it { expect(subject.from_roman_to_hindu_arabic('XCVIII')).must_equal(98) }
      it { expect(subject.from_roman_to_hindu_arabic('XCIX')).must_equal(99) }
      it { expect(subject.from_roman_to_hindu_arabic('C')).must_equal(100) }
      it { expect(subject.from_roman_to_hindu_arabic('CI')).must_equal(101) }
      it { expect(subject.from_roman_to_hindu_arabic('CC')).must_equal(200) }
      it { expect(subject.from_roman_to_hindu_arabic('CCC')).must_equal(300) }
      it { expect(subject.from_roman_to_hindu_arabic('CD')).must_equal(400) }
      it { expect(subject.from_roman_to_hindu_arabic('D')).must_equal(500) }
      it { expect(subject.from_roman_to_hindu_arabic('DC')).must_equal(600) }
      it { expect(subject.from_roman_to_hindu_arabic('DCC')).must_equal(700) }
      it { expect(subject.from_roman_to_hindu_arabic('DCCC')).must_equal(800) }
      it { expect(subject.from_roman_to_hindu_arabic('CM')).must_equal(900) }
      it { expect(subject.from_roman_to_hindu_arabic('CMXCVIII')).must_equal(998) }
      it { expect(subject.from_roman_to_hindu_arabic('CMXCIX')).must_equal(999) }
      it { expect(subject.from_roman_to_hindu_arabic('M')).must_equal(1000) }
      it { expect(subject.from_roman_to_hindu_arabic('MI')).must_equal(1001) }
      it { expect(subject.from_roman_to_hindu_arabic('MM')).must_equal(2000) }
      it { expect(subject.from_roman_to_hindu_arabic('MMM')).must_equal(3000) }
      it { expect(subject.from_roman_to_hindu_arabic('MMMCCCXXXIII')).must_equal(3333) }
      it { expect(subject.from_roman_to_hindu_arabic('MMMCMXCIX')).must_equal(3999) }
    end
  end
end
