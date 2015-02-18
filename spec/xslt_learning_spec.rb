require 'spec_helper'
require 'nokogiri'

describe 'XSLT learning' do

  it 'parses an XML documents' do
    xml = <<-XML
      <root>
        <aliens>
          <alien>
            <name>Alf</name>
            <landed>2015-01-01</landed>
          </alien>
        </aliens>
      </root>
    XML

    xml_doc  = Nokogiri::XML(xml)

    expect(xml_doc.xpath('//landed').text).to eq('2015-01-01')
  end

end
