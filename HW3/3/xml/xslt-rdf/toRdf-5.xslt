<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions"
   xmlns:person="http://www.our-example-data.org/person/xsd"
   xmlns:jani="http://www.our-example-data.org/janitor/xsd"
   xmlns:stud="http://www.our-example-data.org/student/xsd"
   xmlns:uni="http://www.our-example-data.org/university/xsd"
   xmlns:dorm="http://www.our-example-data.org/dormitory/xsd">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefix">http://www.our-example-data.org/</xsl:variable>
    
    <xsl:template match="dorm:Dormitories">
        @prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
        @prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
        @prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .
        
        @prefix ex: &lt;http://example.org/vocabulary/&gt; .
        @prefix uni: &lt;http://www.our-example-data.org/university&gt; .
        @prefix dorm: &lt;http://www.our-example-data.org/dormitory&gt; .
        @prefix droom: &lt;http://www.our-example-data.org/dorm-room&gt; .
        @prefix stud: &lt;http://www.our-example-data.org/student&gt; .
        @prefix jani: &lt;http://www.our-example-data.org/janitor&gt; .

    <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="dorm:Dormitory">
        <xsl:value-of select="concat('dorm:', dorm:Name)"/> a ex:Dormitory ;
            ex:dormitoryAddress &quot;<xsl:value-of select="dorm:address"/>&quot; ;
            dcterms:title &quot;<xsl:value-of select="dorm:title"/>&quot;@<xsl:value-of select="dorm:title/@xml:lang"/> ;
        <xsl:choose>
        <xsl:when test="uni:University/uni:Name!=''">
            ex:hasBedBugs <xsl:value-of select="dorm:hasBedBugs"/> ;
            ex:belongsTo uni:<xsl:value-of select="uni:University/uni:Name"/> .
        </xsl:when>
        <xsl:otherwise>
            ex:hasBedBugs <xsl:value-of select="dorm:hasBedBugs"/> .
        </xsl:otherwise>
        </xsl:choose>

    <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="dorm:DormRoom">
        <xsl:value-of select="concat('droom:', ../../dorm:Name, dorm:Number)"/> a ex:DormRoom ;
            ex:floor <xsl:value-of select="dorm:Floor"/> ;
            ex:number <xsl:value-of select="dorm:Number"/> ;
            ex:capacity <xsl:value-of select="dorm:Capacity"/> ;
            ex:hasToilet <xsl:value-of select="dorm:HasToilet"/> ;
            ex:isIn dorm:<xsl:value-of select="../../dorm:Name"/> ;
            rdfs:label &quot;<xsl:value-of select="concat(../../dorm:Name, ' Dorm room number ', dorm:Number)"/>&quot;@en .

    <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="stud:Student">
        <xsl:value-of select="concat('stud:', person:FirstName)"/> a ex:Student ;
            foaf:firstName &quot;<xsl:value-of select="person:FirstName"/>&quot;@<xsl:value-of select="person:FirstName/@xml:lang"/> ;
            <xsl:apply-templates select="person:MiddleNames/person:MiddleName"/>
            foaf:lastName &quot;<xsl:value-of select="person:LastName"/>&quot;@<xsl:value-of select="person:LastName/@xml:lang"/> ;
            ex:personID <xsl:value-of select="person:id"/> ;
            ex:staysIn <xsl:value-of select="concat('droom:', ../../../../dorm:Name, ../../dorm:Number)"/> ;
            ex:studiesAt uni:<xsl:value-of select="stud:Universities/uni:University/uni:Name"/> ;
            rdfs:label &quot;Student <xsl:value-of select="concat(person:FirstName, ' ', person:LastName)"/>&quot;@en .
    </xsl:template>

    <xsl:template match="person:MiddleNames/person:MiddleName">
            ex:middleName &quot;<xsl:value-of select="."/>&quot;@<xsl:value-of select="./@xml:lang"/> ;
    </xsl:template>

    <xsl:template match="uni:University">
        <xsl:value-of select="concat('uni:', uni:Name)"/> a ex:University ;
            dcterms:title &quot;<xsl:value-of select="uni:Name"/>&quot;@<xsl:value-of select="uni:Name/@xml:lang"/> ;
            ex:universityID <xsl:value-of select="uni:id"/> ;
            foaf:homepage &lt;<xsl:value-of select="uni:webPage"/>&gt; .
    </xsl:template>

    <xsl:template match="jani:Janitor">
        <xsl:value-of select="concat('jani:', person:FirstName)"/> a ex:Janitor ;
            foaf:firstName &quot;<xsl:value-of select="person:FirstName"/>&quot;@<xsl:value-of select="person:FirstName/@xml:lang"/> ;
            <xsl:apply-templates select="person:MiddleNames/person:MiddleName"/>
            foaf:lastName &quot;<xsl:value-of select="person:LastName"/>&quot;@<xsl:value-of select="person:LastName/@xml:lang"/> ;
            ex:personID <xsl:value-of select="person:id"/> ;
            ex:ownsBroom <xsl:value-of select="jani:OwnsBroom"/> ;
            ex:worksIn uni:<xsl:value-of select="../../dorm:Name"/> ;
            rdfs:label &quot;Janitor <xsl:value-of select="concat(person:FirstName, ' ', person:LastName)"/>&quot;@en .
    </xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>