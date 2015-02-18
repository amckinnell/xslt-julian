require 'spec_helper'
require 'nokogiri'

require 'nulogy_extension'

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

  before do
    Nokogiri::XSLT.register 'http://nulogy.com/functions', NulogyExtension
  end

  it 'transforms an XML document using extensions' do
    xslt = build_xslt_that_matches('alien/landed')

    transformed_xml = transform(xml, xslt)

    expect(transformed_xml.xpath('//result').text).to eq('2457024')
  end

  context 'errors' do

    it 'fails when the date format cannot be parsed' do
      xslt = build_xslt_that_matches('alien/name')

      expect { transform(xml, xslt) }.to raise_error(ArgumentError, /Invalid date/)
    end

    it 'fails when we pass a node set by mistake' do
      xslt = build_xslt_that_matches('aliens')

      expect { transform(xml, xslt) }.to raise_error(ArgumentError, /Invalid date/)
    end

  end

  private

  def build_xslt_that_matches(xpath_expression)
    <<-XSLT
      <?xml version="1.0" encoding="utf-8"?>
        <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
            xmlns:nu="http://nulogy.com/functions" extension-element-prefixes="nu">
          <xsl:template match="#{xpath_expression}">
            <result><xsl:value-of select="nu:to_jd(text())"/></result>
          </xsl:template>
        </xsl:stylesheet>
    XSLT
  end

  def transform(xml, xslt)
    Nokogiri::XSLT(xslt).transform(Nokogiri::XML(xml))
  end

end
