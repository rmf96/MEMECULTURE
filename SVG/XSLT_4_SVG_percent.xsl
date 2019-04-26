<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output indent="yes" method="xml" omit-xml-declaration="yes"/>
    <xsl:template match="/">
            <svg height="375" xmlns="http://www.w3.org/2000/svg">
                <g transform="translate(50, 330)">
                    <line x1="0" x2="0" y1="0" y2="-320" stroke="black" stroke-width="1"/>
                    <line x1="0" x2="300" y1="0" y2="0" stroke="black" stroke-width="1"/>                  
                    <text x="-10" y="5" text-anchor="end">0</text>
                    <text x="-10" y="-145" text-anchor="end">50</text>
                    <text x="-10" y="-295" text-anchor="end">100</text>
                    <line x1="0" x2="300" y1="-150" y2="-150" stroke="black" opacity="0.5"
                        stroke-dasharray="8 4" stroke-width="1"/>
                    <xsl:variable name="xPosition" select="(position() - 1) * 30"/>
                    <xsl:variable name="totalSUBJ" select="count(//meme[descendant::phrase[@role= 'SUBJ']])"/>
                    <xsl:variable name="presentSUBJ" select="count(//meme[descendant::phrase[@role = 'SUBJ' and @presence]])"/>
                    <xsl:variable name="nullSUBJ" select="count(//meme[not(descendant::phrase[@role = 'SUBJ' and @presence])])"/>
                    <xsl:variable name="presentSUBJpercent" select="$presentSUBJ div $totalSUBJ"/>
                    <xsl:variable name="nullSUBJpercent" select="$nullSUBJ div $totalSUBJ"/>
                    <rect x="70" y="-{$presentSUBJpercent * 300}" stroke="black" stroke-width=".5"
                        fill="blue" width="{50}" height="{$presentSUBJpercent * 300}"/>
                    <rect x="180" y="-{$nullSUBJpercent * 300}" stroke="black" stroke-width=".5"
                        fill="yellow" width="{50}" height="{$nullSUBJpercent * 300}"/>
                    <text x="50" y="25" text-anchor="initial">Present SUBJ</text>
                    <text x="170" y="25" text-anchor="initial">Null SUBJ</text>
                </g>
            </svg>
    </xsl:template>
</xsl:stylesheet>
