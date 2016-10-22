# xslt-julian
An experiment in adding a julian date XSLT extension function.

Makes the <code>NulogyExtension.to_jd</code> method available to <code>Nokogiri</code> xslt transformations.

```
Nokogiri::XSLT.register 'http://nulogy.com/extensions', NulogyExtension
```

```
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:nu="http://nulogy.com/extensions" extension-element-prefixes="nu">
  <xsl:template match="submitted_on">
    <result><xsl:value-of select="nu:to_jd(text())"/></result>
  </xsl:template>
</xsl:stylesheet>
```
