<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Meme translations</title>
            </head>
            <link rel="stylesheet" type="text/css" href="XSLTMeme.css"/>
            <body>
                <h1>Meme Collection</h1>
                <h2>Table of contents</h2>
                <ul>
                    <xsl:apply-templates select="//meme" mode="toc"/>
                </ul>
                <hr/>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="meme" mode="toc">
        <li>
            <xsl:apply-templates select="title"/>
        </li>
    </xsl:template>
    <xsl:template match="meme">
        <h2>
            <xsl:apply-templates select="title"/>
        </h2>
        <p><xsl:apply-templates select="text"/></p>
    </xsl:template>
<!--    <xsl:template match="phrase">
        <p>
            <xsl:apply-templates select="@pos"/>
        </p>
    </xsl:template>
    <xsl:template match="frag">
        <xsl:apply-templates select="/"/>
    </xsl:template> -->
</xsl:stylesheet>