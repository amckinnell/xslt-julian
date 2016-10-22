require 'spec_helper'
require 'nokogiri'

RSpec.describe 'XSLT learning' do
  let(:xml) do
    <<-XML
      <root>
        <aliens>
          <alien>
            <name>Alf</name>
            <landed>2015-01-01</landed>
          </alien>
        </aliens>
      </root>
    XML
  end

  let(:xslt) do
    <<-XSLT
    <?xml version="1.0" encoding="utf-8"?>
      <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="/">
          <result>testing 1... 2... 3...</result>
        </xsl:template>
      </xsl:stylesheet>
    XSLT
  end

  it 'transforms an XML document' do
    xml_doc = Nokogiri::XML(xml)
    xslt_doc = Nokogiri::XSLT(xslt)

    transformed_xml = xslt_doc.transform(xml_doc)

    expect(transformed_xml.xpath('//result').text).to eq('testing 1... 2... 3...')
  end
end
