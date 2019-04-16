<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output indent="yes" method="xml" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <div class="null-svg">
            <svg height="375" xmlns="http://www.w3.org/2000/svg">
                <g transform="translate(50, 330)">
                    <line x1="0" x2="0" y1="0" y2="-320" stroke="black" stroke-width="1"/>
                    <line x1="0" x2="600" y1="0" y2="0" stroke="black" stroke-width="1"/>

                    <text x="-10" y="5" text-anchor="end">0</text>
                    <text x="-10" y="-145" text-anchor="end">150</text>
                    <text x="-10" y="-295" text-anchor="end">300</text>
                    <xsl:variable name="nonNullCount" as="xs:integer"
                        select="count(//meme[not(descendant::phrase[@role = 'SUBJ' and @presence])])"/>
                    <xsl:variable name="nullCount" as="xs:integer"
                        select="count(//meme[descendant::phrase[@role = 'SUBJ' and @presence]])"/>
                    <rect x="5" y="-{$nonNullCount}" width="60" height="{$nonNullCount}" fill="red"/>
                    <rect x="70" y="-{$nullCount}" width="60" height="{$nullCount}" fill="blue"/>
                    <line x1="0" x2="600" y1="-150" y2="-150" stroke="black" opacity="0.5"
                        stroke-dasharray="8 4" stroke-width="1"/>
                </g>
            </svg>
        </div>
    </xsl:template>
<<<<<<< HEAD

</xsl:stylesheet>
=======
    <xsl:template match="phrase">
        <xsl:variable name="xPosition" select="(position() - 1) * 30"/>
        <xsl:variable name="presentSUBJ" select="phrase[@role='SUBJ']"/>
        <xsl:variable name="nullSUBJ" select="phrase[@role='SUBJ',@presence='null']"/>
        <rect x="{$xPosition + 22}" y="-{$presentSUBJ * 300}" stroke="black" stroke-width=".5"
            fill="green" width="{20}" height="{$presentSUBJ * 300}"/>
        <rect x="{$xPosition + 22}" y="-{$nullSUBJ * 300}" stroke="black" stroke-width=".5"
            fill="red" width="{20}" height="{$nullSUBJ * 300}"/>
        <text>
            
        </text>
    </xsl:template>
</xsl:stylesheet>
>>>>>>> 466c645d33a233d1268d48dac6d9ab465439e44b
