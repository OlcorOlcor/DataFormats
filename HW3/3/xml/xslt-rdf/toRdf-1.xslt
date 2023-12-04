<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefix">http://example.org/resource/</xsl:variable>
    
    <xsl:template match="Universities">
    @prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
    @prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .    
    @prefix ex: &lt;http://example.org/vocabulary/&gt; .
    @prefix uni: &lt;http://www.our-example-data.org/university&gt; .

    <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="University">
    <xsl:value-of select="Name"/> a ex:University ;
            dcterms:title &lt;xsl:value-of select="Name"@&lt;xsl:value-of select="Name/@xml:lang"/&gt;;
            ex:universityID &lt;xsl:value-of select="id"/&gt; ;
            foaf:homepage &lt;xsl:value-of select="webPage"/&gt; .
    </xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>
