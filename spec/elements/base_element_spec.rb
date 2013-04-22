require 'spec_helper'

describe Castiel::Elements::BaseElement do

  describe '#match?' do
    it{ subject.match?('').should be_true  }
    it{ subject.match?(nil).should be_true }
  end

  describe '#evaluate' do
    it{ subject.evaluate(:anything).should == :anything }
  end

end