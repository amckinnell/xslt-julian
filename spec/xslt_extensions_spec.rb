require 'spec_helper'
require 'nokogiri'

require 'nulogy_extensions'

describe 'XSLT extensions' do

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
      <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
          xmlns:nu="http://nulogy.com/functions" extension-element-prefixes="nu">
        <xsl:template match="alien/landed">
          <result><xsl:value-of select="nu:to_jd(text())"/></result>
        </xsl:template>
      </xsl:stylesheet>
    XSLT
  end

  it 'transforms an XML document using extensions' do
    Nokogiri::XSLT.register 'http://nulogy.com/functions', NulogyExtensions

    xml_doc  = Nokogiri::XML(xml)
    xslt_doc  = Nokogiri::XSLT(xslt)

    transformed_xml = xslt_doc.transform(xml_doc)

    expect(transformed_xml.xpath('//result').text).to eq('2457024')
  end

end
