require 'spec_helper'

require_relative '../lib/nulogy_extension'

describe NulogyExtension do

  it 'converts a date string to a julian date' do
    jan_1 = '2015-01-01'
    jan_3 = '2015-01-03'

    expect(subject.to_jd(jan_3) - subject.to_jd(jan_1)).to eq(2)
  end

end
