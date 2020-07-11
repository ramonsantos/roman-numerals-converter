# frozen_string_literal: true

require 'minitest/autorun'
require 'numeral_converter'
require_relative 'support/test_helper'

describe NumeralConverter do
  describe '#from_hindu_arabic_to_roman' do
    subject { NumeralConverter }

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

    describe 'when success' do
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
end
