<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:dorm="http://www.our-example-data.org/dormitory/xsd"
xmlns:uni="http://www.our-example-data.org/university/xsd">


    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
</xsl:text>    
        <html lang="en">
            <head>
                <title>List of dormitories</title>
            </head>
            <body>
                <h1>Dormitories</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
   
    <xsl:template match="dorm:Dormitory">
        <h2><xsl:value-of select="dorm:Name"/></h2>
        <dl>
            <dt>Address</dt>
            <dd><xsl:value-of select="dorm:address"/></dd>
            <dt>University</dt>
            <dd><xsl:value-of select="uni:University/uni:Name"/></dd>
            <dt>Does it have bed bugs?</dt>
            <dd><xsl:value-of select="dorm:hasBedBugs"/></dd>
        </dl>
    </xsl:template>
   
    <xsl:template match="text()"/>
   
</xsl:stylesheet>
