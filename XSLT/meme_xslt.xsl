<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head></head>
                <title>Meme</title>
            <link rel="stylesheet" type="text/css" href="meme_02_css.css"/>
            <body>
                <h2>Meme Collection</h2>
                <h3>Title | Type | Example</h3>
                <h3>
                    <xsl:for-each select="meme">
                        <xsl:value-of select="title"/>
                        <xsl:text> | </xsl:text>
                        <xsl:value-of select="text/@type"/>
                    </xsl:for-each>
                </h3>
                <xsl:apply-templates select="//text"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="text">
        <xsl:apply-templates/>
    </xsl:template>
  <!--  <xsl:template match="frag">
        <h4>
            <xsl:apply-templates select="@n"/>
        </h4>
        <xsl:apply-templates/>
        <br/>
    </xsl:template> -->
    <xsl:template match="frag">
        <xsl:choose>
            <xsl:when test="phrase[@role='SUBJ' and @presence='null']">
                <span class="null">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>