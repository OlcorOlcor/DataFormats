<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefix">http://example.org/resource/</xsl:variable>
    
    <xsl:template match="Dormitories">
        @prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
        @prefix foaf: <http://xmlns.com/foaf/0.1/> .
        @prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
        @prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
        @prefix dcterms: <http://purl.org/dc/terms/> .
        
        @prefix ex: <http://example.org/vocabulary/> .
        @prefix data: <http://www.our-example-data.org/> .
        @prefix uni: <http://www.our-example-data.org/university> .
        @prefix dorm: <http://www.our-example-data.org/dormitory> .
        @prefix droom: <http://www.our-example-data.org/dorm-room> .
        @prefix stud: <http://www.our-example-data.org/student> .
        @prefix jani: <http://www.our-example-data.org/janitor> .

    <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="Dormitory">
        <xsl:value-of select="Name"/> a ex:Dormitory ;
            ex:dormitoryAddress &lt;xsl:value-of select="address"/&gt;;
            dcterms:title &lt;xsl:value-of select="Name"@&lt;xsl:value-of select="Name/@xml:lang"/&gt; ;
            ex:hasBedBugs &lt;xsl:value-of select="hasBedBugs"/&gt; ;
            ex:belongsTo uni:&lt;xsl:value-of select="uni:University/uni:Name"/&gt; .
    </xsl:template>

    <xsl:template match="DormRoom">
        <xsl:value-of select="concat(../Name, Number)"/> a ex:DormRoom ;
            ex:floor &lt;xsl:value-of select="Floor"/&gt;;
            ex:number &lt;xsl:value-of select="Number"/&gt; ;
            ex:capacity &lt;xsl:value-of select="Capacity"/&gt; ;
            ex:hasToilet &lt;xsl:value-of select="HasToilet"/&gt; ;
            ex:isIn dorm:&lt;xsl:value-of select="../Name"/&gt; ;
            rdfs:label &lt;xsl:value-of select="concat(../Name, ' Dorm room number ', "Number")"/&gt;"@en .
    </xsl:template>

    <xsl:template match="Student">
    <xsl:value-of select="FirstName"/> a ex:Student ;
            foaf:firstName &lt;xsl:value-of select="person:FirstName"@&lt;xsl:value-of select="person:FirstName/@xml:lang"/&gt;;
            ex:middleName &lt;xsl:value-of select="person:MiddleName"@&lt;xsl:value-of select="person:MiddleName/@xml:lang"/&gt; ;
            foaf:lastName &lt;xsl:value-of select="person:LastName"@&lt;xsl:value-of select="person:LastName/@xml:lang"/&gt; ;
            ex:personID &lt;xsl:value-of select="person:id"/&gt; ;
            ex:studiesAt uni:&lt;xsl:value-of select="Universities/uni:University/uni:Name"/&gt; ;
            rdfs:labal "Student&lt;xsl:value-of select="concat(person:FirstName, person:LastName)"/&gt; .
    </xsl:template>

    <xsl:template match="University">
        <xsl:value-of select="Name"/> a ex:University ;
            dcterms:title &lt;xsl:value-of select="Name"@&lt;xsl:value-of select="Name/@xml:lang"/&gt;;
            ex:universityID &lt;xsl:value-of select="id"/&gt; ;
            foaf:homepage &lt;xsl:value-of select="webPage"/&gt; .
    </xsl:template>

    <xsl:template match="Janitor">
    <xsl:value-of select="FirstName"/> a ex:Janitor ;
            foaf:firstName &lt;xsl:value-of select="person:FirstName"@&lt;xsl:value-of select="FirstName/@xml:lang"/&gt;;
            ex:middleName &lt;xsl:value-of select="person:MiddleName"@&lt;xsl:value-of select="MiddleName/@xml:lang"/&gt; ;
            foaf:lastName &lt;xsl:value-of select="person:LastName"@&lt;xsl:value-of select="LastName/@xml:lang"/&gt; ;
            ex:personID &lt;xsl:value-of select="person:id"/&gt; ;
            ex:ownsBroom &lt;xsl:value-of select="OwnsBroom"/&gt; ;
            rdfs:labal "Janitor"&lt;xsl:value-of select="concat(person:FirstName, person:LastName)"&lt; .
    </xsl:template>

    <xsl:template match="text()"/>

    <xsl:template match="text()"/>
</xsl:stylesheet>