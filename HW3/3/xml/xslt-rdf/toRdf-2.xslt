<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefix">http://example.org/resource/</xsl:variable>
    
    <xsl:template match="Students">
    @prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
    @prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .    
    @prefix ex: &lt;http://example.org/vocabulary/&gt; .
    @prefix uni: &lt;http://www.our-example-data.org/university&gt; .
    @prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
    @prefix droom: &lt;http://www.our-example-data.org/dorm-room&gt; .

    <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="Student">
    <xsl:value-of select="FirstName"/> a ex:Student ;
            foaf:firstName &lt;xsl:value-of select="person:FirstName"@&lt;xsl:value-of select="FirstName/@xml:lang"/&gt;;
            ex:middleName &lt;xsl:value-of select="person:MiddleName"@&lt;xsl:value-of select="MiddleName/@xml:lang"/&gt; ;
            foaf:lastName &lt;xsl:value-of select="person:LastName"@&lt;xsl:value-of select="LastName/@xml:lang"/&gt; ;
            ex:personID &lt;xsl:value-of select="person:id"/&gt; ;
            rdfs:labal "Student&lt;xsl:value-of select="concat(person:FirstName, person:LastName)"&lt;" .
        </xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>