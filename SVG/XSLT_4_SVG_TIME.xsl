<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output indent="yes" method="xml" omit-xml-declaration="yes"/>
    <xsl:variable name="memesInOrder" as="xs:string+"
        select='
            "Success Kid", "Doge", "Scumbag Steve", "College Freshman",
            "Bad Luck Brian", "Drake", "Arthur&apos;s Fist", "Math Lady", "Distracted Boyfriend", "Roll Safe",
            "Lisa Simpson Powerpoint", "Savage Patrick"'/>
    <xsl:variable name="yearsInOrder" as="xs:string+"
        select="'2008', '2010', '2011', '2011', '2012', '2016', '2016', '2016', '2017', '2017', '2018', '2018'"/>
    <xsl:template match="/">
        <svg height="575" xmlns="http://www.w3.org/2000/svg">
            <g transform="translate(50, 330)">
                <line x1="0" x2="0" y1="0" y2="-320" stroke="black" stroke-width="1"/>
                <line x1="0" x2="650" y1="0" y2="0" stroke="black" stroke-width="1"/>
                <text x="-10" y="5" text-anchor="end">0</text>
                <text x="-10" y="-145" text-anchor="end">50</text>
                <text x="-10" y="-295" text-anchor="end">100</text>
                <line x1="0" x2="650" y1="-150" y2="-150" stroke="black" opacity="0.5"
                    stroke-dasharray="8 4" stroke-width="1"/>
                <xsl:for-each-group select="//meme"
                    group-by="normalize-space(replace(title, '\d+', ''))">
                    <xsl:sort select="index-of($memesInOrder, current-grouping-key())"/>
                    <xsl:variable name="year" select="$yearsInOrder[index-of($memesInOrder, current-grouping-key())]"/>
                    <xsl:variable name="totalSUBJ"
                        select="count(current-group()//phrase[@role = 'SUBJ'])"/>
                    <xsl:variable name="nullSUBJ"
                        select="count(current-group()//phrase[@presence and @role = 'SUBJ'])"/>
                    <xsl:variable name="nullPercent" select="300 * $nullSUBJ div $totalSUBJ"/>
                    <xsl:variable name="xPosition" select="position() * 50"/>
                    <rect x="{$xPosition}" y="-{$nullPercent}" width="35" height="{$nullPercent}"
                        fill="orange"/>
                    <text x="{$xPosition}" y="20"
                        transform="translate(2, 35) rotate(90 {$xPosition + 30} 0)">
                        <xsl:value-of select="current-grouping-key() || ' (' || $year|| ')'"/>
                    </text>
                    <text x="{$xPosition + 17.5}" y="-{$nullPercent + 15}" stroke="black"
                        text-anchor="middle">
                        <xsl:value-of select="format-number($nullPercent div 3, '0.00')"/>
                    </text>
                </xsl:for-each-group>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>
