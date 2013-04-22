require 'spec_helper'

describe Castiel::Elements::HourElement do

  describe '#match?' do
    context 'Should return true' do
      it{ ('0'..'23').each {|hour| subject.match?(hour).should be_true} }
      it{ ('00'..'23').each{|hour| subject.match?(hour).should be_true} }
    end

    context 'Should return false' do
      it{ ('24'..'99').each{|hour| subject.match?(hour).should be_false} }
      it{ subject.match?('').should be_false }
      it{ subject.match?(nil).should be_false }
    end
  end

  describe '#evaluate' do
    it{ ('0'..'23').each{|hour| subject.evaluate(hour).should == hour.to_i}}
  end

end