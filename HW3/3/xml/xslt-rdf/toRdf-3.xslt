<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions"
   xmlns:person="http://www.our-example-data.org/person/xsd"
   xmlns:jani="http://www.our-example-data.org/janitor/xsd">

    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefix">http://www.our-example-data.org/</xsl:variable>
    
    <xsl:template match="jani:Janitors">
    @prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
    @prefix ex: &lt;http://example.org/vocabulary/&gt; .
    @prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .

    <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="jani:Janitor">
    <xsl:value-of select="person:FirstName"/> a ex:Janitor ;
            foaf:firstName &quot;<xsl:value-of select="person:FirstName"/>&quot;@<xsl:value-of select="person:FirstName/@xml:lang"/>;
            <xsl:apply-templates select="person:MiddleNames/person:MiddleName" mode="true"/>
            foaf:lastName &quot;<xsl:value-of select="person:LastName"/>&quot;@<xsl:value-of select="person:LastName/@xml:lang"/> ;
            ex:personID <xsl:value-of select="person:id"/> ;
            ex:ownsBroom <xsl:value-of select="jani:OwnsBroom"/> ;
            rdfs:label &quot;Janitor <xsl:value-of select="concat(person:FirstName, ' ', person:LastName)"/>&quot;@en .
    </xsl:template>

    <xsl:template match="person:MiddleNames/person:MiddleName" mode="true">
            ex:middleName &quot;<xsl:value-of select="."/>&quot;@<xsl:value-of select="./@xml:lang"/> ;
    </xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>