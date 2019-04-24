<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output indent="yes" method="xml" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <div class="null-svg-percentage">
            <svg height="375" xmlns="http://www.w3.org/2000/svg">
                <g transform="translate(50, 330)">
                    <line x1="0" x2="0" y1="0" y2="-320" stroke="black" stroke-width="1"/>
                    <line x1="0" x2="600" y1="0" y2="0" stroke="black" stroke-width="1"/>                  
                    <text x="-10" y="5" text-anchor="end">0</text>
                    <text x="-10" y="-145" text-anchor="end">50</text>
                    <text x="-10" y="-295" text-anchor="end">100</text>
                   
                    <!-- Don't know if I need this 
                    <xsl:variable name="nonNullPCT" as="xs:integer"
                        select="count(//meme[not(descendant::phrase[@role = 'SUBJ' and @presence])])"/>
                    <xsl:variable name="nullPCT" as="xs:integer"
                        select="count(//meme[descendant::phrase[@role = 'SUBJ' and @presence]])"/>
                    <rect x="5" y="-{$nonNullPCT}" width="60" height="{$nonNullPCT}" fill="red"/>
                    <rect x="70" y="-{$nullPCT}" width="60" height="{$nullPCT}" fill="blue"/> -->
                    
                    <line x1="0" x2="600" y1="-150" y2="-150" stroke="black" opacity="0.5"
                        stroke-dasharray="8 4" stroke-width="1"/>
                    <xsl:apply-templates select="//phrase"/>
                </g>
            </svg>
        </div>
    </xsl:template>
    <xsl:template match="phrase">
        <xsl:variable name="xPosition" select="(position() - 1) * 30"/>
        <xsl:variable name="totalSUBJ" select="sum(//meme[descendant::phrase[@role= 'SUBJ']])"/>
       
        <!--  May not need this either   <xsl:variable name="totalNull" select="sum(//meme[descendant::phrase[@role = 'SUBJ' and @presence]])"/>
        <xsl:variable name="totalNonNull" select="sum(//meme[not(descendant::phrase[@role = 'SUBJ' and @presence])])"/>   -->
        
        <xsl:variable name="presentSUBJ" select="sum(//meme[descendant::phrase[@role = 'SUBJ' and @presence]])"/>
        <xsl:variable name="nullSUBJ" select="sum(//meme[not(descendant::phrase[@role = 'SUBJ' and @presence])])"/>
        <xsl:variable name="presentSUBJpercent" select="$presentSUBJ div $totalSUBJ"/>
        <xsl:variable name="nullSUBJpercent" select="$nullSUBJ div $totalSUBJ"/>
        <rect x="{$xPosition + 22}" y="-{$presentSUBJpercent * 300}" stroke="black" stroke-width=".5"
            fill="blue" width="{20}" height="{$presentSUBJpercent * 300}"/>
        <rect x="{$xPosition + 22}" y="-{$nullSUBJpercent * 300}" stroke="black" stroke-width=".5"
            fill="yellow" width="{20}" height="{$nullSUBJpercent * 300}"/>
        <text>
            
        </text>
    </xsl:template>
</xsl:stylesheet>
