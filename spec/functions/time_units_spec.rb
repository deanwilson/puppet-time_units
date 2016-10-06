require 'spec_helper'

describe 'time_units' do
  describe 'when given simple conversions' do
    it 'should return seconds in a week' do
      should run.with_params(1, 'week', 'in', 'seconds').and_return(604_800)
    end
    it 'should return minutes in seconds with "pretty" calling' do
      should run.with_params(10, 'minutes', 'in', 'seconds').and_return(600)
    end
  end

  #################################################
  ## Invalid function call tests
  ##################################################

  describe 'when called incorrectly' do
    it 'should throw an ArgumentError unless called with 3 or 4 arguments' do
      expect { subject.call([1, 'week']) }.to raise_error(ArgumentError)
    end

    it 'should throw an ArgumentError unless called with a "from" unit it knows' do
      expect { subject.call([1, 'flerg', 'in', 'seconds']) }.to raise_error(ArgumentError)
    end

    it 'should throw an ArgumentError unless called with a "to" unit it knows' do
      expect { subject.call([1, 'week', 'in', 'frogs']) }.to raise_error(ArgumentError)
    end
  end
end
