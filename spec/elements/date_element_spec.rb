require 'spec_helper'

describe Castiel::Elements::DateElement do

  describe '#match?' do
    context 'Should return true' do
      it{ subject.match?('1977-03-14').should be_true }
      it{ subject.match?('14/03/1977').should be_true }
    end

    context 'Should return false' do
      it{ subject.match?('1977-03').should be_false    }
      it{ subject.match?('14 03 1977').should be_false }
    end
  end

  describe '#evaluate' do
    it{ subject.evaluate('1977-03-14').should == Time.parse('1977-03-14 00:00') }
    it{ subject.evaluate('14/03/1977').should == Time.parse('1977-03-14 00:00') }
  end

end