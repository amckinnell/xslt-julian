require 'spec_helper'

RSpec.describe 'Convert to a Julian Date' do
  it 'convert a date to a julian date' do
    january_1 = Date.new(2015, 1, 1)
    january_3 = Date.new(2015, 1, 3)

    p "January 1: #{january_1} becomes #{january_1.jd}"
    p "January 3: #{january_3} becomes #{january_3.jd}"

    expect(january_3.jd - january_1.jd).to eq(2)
  end

  it 'converts a date string to a julian date' do
    jd_1 = to_jd('2015-01-01')
    jd_3 = to_jd('2015-01-03')

    p "January 1: #{jd_1}"
    p "January 3: #{jd_3}"

    expect(jd_3 - jd_1).to eq(2)
  end

  def to_jd(date)
    Date.parse(date).jd
  end
end
