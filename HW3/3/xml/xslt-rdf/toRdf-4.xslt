<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions"
   xmlns:person="http://www.our-example-data.org/person/xsd"
   xmlns:stud="http://www.our-example-data.org/student/xsd"
   xmlns:uni="http://www.our-example-data.org/university/xsd">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefix">http://www.our-example-data.org/</xsl:variable>
    
    <xsl:template match="Students">
    @prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
    @prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .    
    @prefix ex: &lt;http://example.org/vocabulary/&gt; .
    @prefix uni: &lt;http://www.our-example-data.org/university&gt; .
    @prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .

    <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="stud:Student">
    <xsl:value-of select="concat('stud:', person:FirstName)"/> a ex:Student ;
            foaf:firstName &quot;<xsl:value-of select="person:FirstName"/>&quot;@<xsl:value-of select="person:FirstName/@xml:lang"/>;
            <xsl:apply-templates select="person:MiddleNames/person:MiddleName" mode="true"/>
            foaf:lastName &quot;<xsl:value-of select="person:LastName"/>&quot;@<xsl:value-of select="person:LastName/@xml:lang"/> ;
            ex:personID <xsl:value-of select="person:id"/> ;
            rdfs:label &quot;Student <xsl:value-of select="concat(person:FirstName, ' ', person:LastName)"/>&quot;@en .
    </xsl:template>

    <xsl:template match="uni:University">
    <xsl:value-of select="concat('uni:', uni:Name)"/> a ex:University ;
            dcterms:title &quot;<xsl:value-of select="uni:Name"/>&quot;@<xsl:value-of select="uni:Name/@xml:lang"/>;
            ex:universityID <xsl:value-of select="uni:id"/>;
            foaf:homepage &quot;<xsl:value-of select="uni:webPage"/>&quot; .
    </xsl:template>

    <xsl:template match="person:MiddleNames/person:MiddleName" mode="true">
            ex:middleName &quot;<xsl:value-of select="."/>&quot;@<xsl:value-of select="./@xml:lang"/> ;
    </xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>