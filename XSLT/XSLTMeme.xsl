<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Meme-Syntax XSLT</title>
            </head>
            <link rel="stylesheet" type="text/css" href="XSLTMeme.css"/>
            <body>
               <h1>Meme</h1>
               <h2>Contents</h2>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="phrase">
          <p>
              <xsl:apply-templates select="@pos"/>
          </p>
    </xsl:template>
    <xsl:template match="frag">
        <xsl:apply-templates select="/"/>
    </xsl:template>
    
</xsl:stylesheet>