require_relative '../lib/nulogy_extension'

RSpec.describe NulogyExtension do
  it 'converts a date string to a julian date' do
    january_1 = '2015-01-01'
    january_3 = '2015-01-03'

    expect(subject.to_jd(january_3) - subject.to_jd(january_1)).to eq(2)
  end
end
