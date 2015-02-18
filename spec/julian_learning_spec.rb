require 'spec_helper'

def to_jd(date)
  Date.parse(date).jd
end

describe 'Convert to a Julian Date' do

  it 'convert a date to a julian date' do
    jan_1 = Date.new(2015, 01, 01)
    jan_3 = Date.new(2015, 01, 03)

    p "January 1: #{jan_1} becomes #{jan_1.jd}"
    p "January 3: #{jan_3} becomes #{jan_3.jd}"

    expect(jan_3.jd - jan_1.jd).to eq(2)
  end

  it 'converts a date string to a julian date' do
    jd_1 = to_jd('2015-01-01')
    jd_3 = to_jd('2015-01-03')

    p "January 1: #{jd_1}"
    p "January 3: #{jd_3}"

    expect(jd_3 - jd_1).to eq(2)
  end

end
