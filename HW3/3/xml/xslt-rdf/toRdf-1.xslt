<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions"
   xmlns:uni="http://www.our-example-data.org/university/xsd">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefix">http://www.our-example-data.org/</xsl:variable>
    
    <xsl:template match="uni:Universities">
    @prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
    @prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .
    @prefix ex: &lt;http://example.org/vocabulary/&gt; .
    @prefix uni: &lt;http://www.our-example-data.org/university/&gt; .

    <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="uni:University">
    <xsl:value-of select="concat('uni:', uni:Name)"/> a ex:University ;
            dcterms:title &quot;<xsl:value-of select="uni:Name"/>&quot;@<xsl:value-of select="uni:Name/@xml:lang"/>;
            ex:universityID <xsl:value-of select="uni:id"/>;
            foaf:homepage &lt;<xsl:value-of select="uni:webPage"/>&gt; .
    </xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>
