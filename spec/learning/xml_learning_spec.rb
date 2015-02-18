require 'spec_helper'
require 'nokogiri'

describe 'XML learning' do

  let(:xml) do
    <<-XML
      <root>
        <aliens>
          <alien>
            <name colour="brown">Alf</name>
            <landed>2015-01-01</landed>
          </alien>
        </aliens>
      </root>
    XML
  end

  it 'uses XPath to find things in an XML document' do
    xml_doc  = Nokogiri::XML(xml)

    expect(xml_doc.xpath('//name').text).to eq('Alf')
    expect(xml_doc.xpath('string(//name/@colour)')).to eq('Alf')
  end

end
