require 'spec_helper'
require 'julian'

describe 'Convert to a Julian Date' do

  subject { Julian }

  it 'convert a date to a julian date' do
    jan_1 = Date.new(2015, 01, 01)
    jan_3 = Date.new(2015, 01, 03)

    p "January 1: #{jan_1} becomes #{jan_1.jd}"
    p "January 3: #{jan_3} becomes #{jan_3.jd}"

    expect(jan_3.jd - jan_1.jd).to eq(2)
  end

  it 'converts a date string to a julian date' do
    jd_1 = subject.to_jd('2015-01-01')
    jd_3 = subject.to_jd('2015-01-03')

    p "January 1: #{jd_1}"
    p "January 3: #{jd_3}"

    expect(jd_3 - jd_1).to eq(2)
  end

end
