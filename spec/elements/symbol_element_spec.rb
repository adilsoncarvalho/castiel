require 'spec_helper'

describe Castiel::Elements::SymbolElement do

  describe '#match?' do
    context 'Should return true' do
      context 'when written the proper way' do
        it { subject.match?('yesterday').should be_true }
        it { subject.match?('today').should be_true     }
        it { subject.match?('tomorrow').should be_true  }
      end

      context 'when written with different case' do
        it { subject.match?('YESTERDAY').should be_true }
        it { subject.match?('TODAY').should be_true     }
        it { subject.match?('TOMORROW').should be_true  }
      end

      context 'when using symbols on any case' do
        it { subject.match?(:yesterday).should be_true }
        it { subject.match?(:today).should be_true     }
        it { subject.match?(:tomorrow).should be_true  }
        it { subject.match?(:YESTERDAY).should be_true }
        it { subject.match?(:TODAY).should be_true     }
        it { subject.match?(:TOMORROW).should be_true  }
      end
    end

    context 'Should return false' do
      it { subject.match?('teretete').should be_false }
      it { subject.match?('').should be_false         }
      it { subject.match?(nil).should be_false        }
    end
  end

  describe '#evaluate' do
    # making the clock go back in time on my favorite day ;)
    before(:each)   { Date.stub(:today) { Date.parse('1977-03-14') } }
    let(:yesterday) { (Date.today - 1).to_time }
    let(:today)     { (Date.today).to_time     }
    let(:tomorrow)  { (Date.today + 1).to_time }

    it{ subject.evaluate('yesterday').should == yesterday }
    it{ subject.evaluate('today').should     == today     }
    it{ subject.evaluate('tomorrow').should  == tomorrow  }
  end
end