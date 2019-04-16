<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns="http://www.w3.org/2000/svg"
    version="3.0">
    <xsl:template match="/">
        <svg height="375">
            <g transform="translate(30, 330)">
                <line x1="20" x2="20" y1="0" y2="-320" stroke="black" stroke-width="1"/>
                <line x1="20" x2="600" y1="0" y2="0" stroke="black" stroke-width="1"/>
                <line x1="20" x2="600" y1="-150" y2="-150" stroke="black" opacity="0.5"
                    stroke-dasharray="8 4" stroke-width="1"/>
                <text x="10" y="5" text-anchor="end">0</text>
                <text x="10" y="-145" text-anchor="end">150</text>
                <text x="10" y="-295" text-anchor="end">300</text>
                <xsl:apply-templates select="//phrase"/>
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>