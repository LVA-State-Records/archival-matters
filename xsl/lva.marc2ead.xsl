<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:marc="http://www.loc.gov/MARC21/slim"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:isbn:1-931666-22-9" exclude-result-prefixes="marc">
    <xsl:import href="MARC21slimUtils.xsl"/>
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
        <?filetitle ?>
        <ead xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xi="http://www.w3.org/2001/XInclude" id="vi">
	<eadheader audience="internal" langencoding="iso639-2b" findaidstatus="edited-full-draft">
        	<eadid countrycode="US" mainagencycode="US-Vi">PUBLIC "-//Library of Virginia//TEXT (US::Vi::vi#####::<xsl:text>A Guide to the </xsl:text>
                          <xsl:if test="//marc:record/marc:datafield[@tag=245]">
                            <xsl:value-of select="//marc:record/marc:datafield[@tag=245]/marc:subfield[@code='a']/."/>
                          </xsl:if>
                          <xsl:text> </xsl:text>
                          <xsl:if test="//marc:record/marc:datafield[@tag=245]/marc:subfield[@code='f']">
                          <xsl:value-of select="//marc:record/marc:datafield[@tag=245]/marc:subfield[@code='f']/."/>
                          </xsl:if>)//EN" "vi.xml"
		</eadid>

                <filedesc>
                        <titlestmt>
                        <titleproper>
                        <xsl:text>A Guide to the </xsl:text>
                        	<xsl:if test="//marc:record/marc:datafield[@tag=245]">
                        	<xsl:value-of select="//marc:record/marc:datafield[@tag=245]/marc:subfield[@code='a']/."/>
                        	</xsl:if>
                        <xsl:text> </xsl:text>
                        <xsl:if test="//marc:record/marc:datafield[@tag=245]/marc:subfield[@code='f']">
                        	<date>
                        	<xsl:value-of select="//marc:record/marc:datafield[@tag=245]/marc:subfield[@code='f']/."/>
                        	</date>
                        </xsl:if>
                        </titleproper>
                        
                        <subtitle id="sort">
                        <xsl:if test="//marc:record/marc:datafield[@tag=110]">
                        	<xsl:value-of select="//marc:record/marc:datafield[@tag=110]/marc:subfield[@code='a']/."/>
                        	</xsl:if>
                        	<xsl:if test="//marc:record/marc:datafield[@tag=100]">
                        	<xsl:value-of select="//marc:record/marc:datafield[@tag=100]/marc:subfield[@code='a']/."/>
                        	</xsl:if>
			<num type="collectionnumber">
				<xsl:for-each select="//marc:record/marc:datafield[@tag=099]">
				<xsl:value-of select="./marc:subfield[@code='a']/."/>, </xsl:for-each>
			</num>
			</subtitle>

                        <author>
                        <xsl:if test="//marc:record/marc:datafield[@tag=583]">
                        	<xsl:value-of select="//marc:record/marc:datafield[@tag=583]/marc:subfield[@code='k']/."/>
                        </xsl:if>
                        </author>

                        </titlestmt>
                        <publicationstmt>
			<publisher>Library of Virginia
			</publisher>
			<xi:include xmlns:xi="http://www.w3.org/2001/XInclude" href="http://ead.lib.virginia.edu/vivaead/add_con/lva_address.xi.xml" />
			<date type="publication">&#169; 2013  By The Library of Virginia. All Rights Reserved. 
			</date> 
			</publicationstmt>
                </filedesc>

                <profiledesc>
                        <creation>Machine-readable finding aid derived from MARC record using MarcEdit, <date>2013</date></creation>
                        <langusage>Description is in <language langcode="eng">English</language>
			</langusage>
                </profiledesc>
            </eadheader>
            <frontmatter>
            	<titlepage>
            		<titleproper>
                        <xsl:text>A Guide to the </xsl:text>
                        	<xsl:if test="//marc:record/marc:datafield[@tag=245]">
                        	<xsl:value-of select="//marc:record/marc:datafield[@tag=245]/marc:subfield[@code='a']/."/>
                        	</xsl:if>
                        <xsl:text> </xsl:text>
                        <xsl:if test="//marc:record/marc:datafield[@tag=245]/marc:subfield[@code='f']">
                        	<date>
                        	<xsl:value-of select="//marc:record/marc:datafield[@tag=245]/marc:subfield[@code='f']/."/>
                        	</date>
                        </xsl:if>
                        </titleproper>
                        
                        <subtitle id="sort">A Collection in <lb/>the Library of Virginia
			<num type="Accession Number">
				<xsl:for-each select="//marc:record/marc:datafield[@tag=099]">
				<xsl:value-of select="./marc:subfield[@code='a']/."/>, </xsl:for-each>
			</num>
			</subtitle>

                        <author>
                        <xsl:if test="//marc:record/marc:datafield[@tag=583]">
                        	<xsl:value-of select="//marc:record/marc:datafield[@tag=583]/marc:subfield[@code='k']/."/>
                        </xsl:if>
                        </author>
                        <p id="logostmt">
			<extptr xlink:actuate="onLoad" xlink:show="embed" xlink:type="simple" xlink:href="http://ead.lib.virginia.edu/vivaead/logos/lva.jpg"/>
			</p>
			<publisher>Library of Virginia
			</publisher>
			<date type="publication">2013 
			</date>
			<list type="deflist">
			<defitem>
			<label>Processed by:
			</label>
			<item>Library of Virginia Staff.
			</item>
			</defitem>
			</list>
            	</titlepage>
            </frontmatter>
                <xsl:apply-templates/>
        </ead>
    </xsl:template>

    <xsl:template match="marc:record">
        <archdesc level="collection">
            <runner placement="footer">Library of Virginia</runner>
	<did>
	<head>Descriptive Summary</head>
            <repository label="Repository" encodinganalog="852$a">The Library of Virginia</repository>
            <xsl:for-each select="marc:datafield[@tag=245]">
                <unittitle encodinganalog="245$a" type="collection">
                    <xsl:value-of select="marc:subfield[@code='a']"/>
                </unittitle>

                <xsl:if test="marc:subfield[@code='f']!=''">
                    <unitdate type="inclusive" encodinganalog="245$f">
                        <xsl:value-of select="marc:subfield[@code='f']" />
                    </unitdate>
                </xsl:if>
            </xsl:for-each>
            <unitid encodinganalog="099" countrycode="US">
            	<xsl:for-each select="//marc:record/marc:datafield[@tag=099]">
		<xsl:value-of select="./marc:subfield[@code='a']/."/>, </xsl:for-each></unitid>

            <xsl:for-each select="marc:datafield[@tag=110]">
                <origination label="Creator" encodinganalog="110$a">
                        <xsl:value-of select="./marc:subfield[@code='a']/." /><xsl:text> </xsl:text><xsl:value-of select="./marc:subfield[@code='b']/." />
                </origination>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=300]">
                <physdesc label="Extent" encodinganalog="300$a">

                    <xsl:if test="marc:subfield[@code='a']!=''">
                    <xsl:value-of select="marc:subfield[@code='a']" />
                    </xsl:if>

                    <xsl:if test="marc:subfield[@code='f']!=''">
                            <xsl:text> </xsl:text><xsl:value-of select="marc:subfield[@code='f']" />
                    </xsl:if>

                </physdesc>
            </xsl:for-each>

          </did>

            <xsl:for-each select="marc:datafield[@tag=535]">
                <originalsloc encodinganalog="535">
                    <p><xsl:value-of select="." /></p>
                </originalsloc>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=545]">
                <bioghist encodinganalog="545">
                    <head>Biographical/Historical Information</head>
                    <p><xsl:value-of select="." /></p>
                </bioghist>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=500]">
                <odd encodinganalog="500">
                    <p><xsl:value-of select="." /></p>
                </odd>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=351]">
                <arrangement encodinganalog="351">
                    <p><xsl:value-of select="." /></p>
                </arrangement>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=530]">
                <altformavail encodinganalog="530">
                    <p><xsl:value-of select="." /></p>
                </altformavail>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=506]">
                <accessrestrict encodinganalog="506">
                    <p><xsl:value-of select="." /></p>
                </accessrestrict>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=540]">
                <userestrict encodinganalog="540">
                    <p><xsl:value-of select="." /></p>
                </userestrict>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=524]">
                <prefercite encodinganalog="524">
                    <p><xsl:value-of select="." /></p>
                </prefercite>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=561]">
                <custodhist encodinganalog="561">
                    <p><xsl:value-of select="." /></p>
                </custodhist>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=541]">
                <acqinfo encodinganalog="541">
                <xsl:if test="//marc:record/marc:datafield[@tag=541]/marc:subfield[@code="b">
                    <p>Accession <xsl:value-of select="./marc:subfield[@code='e']/."/" /> was transferred by <xsl:value-of select="./marc:subfield[@code='a']/."/" />, <xsl:value-of select="./marc:subfield[@code='b']/."/" />, <xsl:value-of select="./marc:subfield[@code='d']/."/" /></p>
                </xsl:if>
                </acqinfo>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=584]">
                <accruals encodinganalog="584" id="a10">
                    <p><xsl:value-of select="." /></p>
                </accruals>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=583]">
                <processinfo encodinganalog="583" id="a20">
                    <p><xsl:value-of select="." /></p>
                </processinfo>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=544]">
                <separatedmaterial encodinganalog="544 0" id="a7">
                    <p><xsl:value-of select="." /></p>
                </separatedmaterial>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=581]">
                <bibliography encodinganalog="581" id="a11">
                    <p><xsl:value-of select="." /></p>
                </bibliography>
            </xsl:for-each>

            <xsl:for-each select = "marc:datafield[@tag=555]">
                <otherfindaid encodinganalog="555" id="a8">
                    <p><xsl:value-of select="." /></p>
                </otherfindaid>
            </xsl:for-each>

            <xsl:for-each select="marc:datafield[@tag=544]">
                <relatedmaterial encodinganalog="544 1" id="a6">
                    <p><xsl:value-of select="." /></p>
                </relatedmaterial>
            </xsl:for-each>

            <controlaccess id="a12">
                <p>This collection is indexed under the following headings in the online
                    catalog. Researchers desiring materials about related topics, persons, or
                    places should search the catalog using these headings.</p>

                <xsl:for-each select="marc:datafield[@tag=600]">
                    <controlaccess>
                        <famname source="lcnaf" rules="aacr2r" role="subject"
                            encodinganalog="600">
                            <xsl:for-each select="marc:subfield">
								<xsl:value-of select="." />
								<xsl:if test="position()!=last()">
									<xsl:text> -- </xsl:text>
								</xsl:if>
                            </xsl:for-each>
                        </famname>
                    </controlaccess>
                </xsl:for-each>

                <xsl:for-each select="marc:datafield[@tag=610]">
                    <controlaccess>
                        <corpname source="lcnaf" rules="aacr2r" role="subject"
                            encodinganalog="610">
                            <xsl:for-each select="marc:subfield">
								<xsl:value-of select="." />
								<xsl:if test="position()!=last()">
									<xsl:text> -- </xsl:text>
								</xsl:if>
							</xsl:for-each>
                        </corpname>
                    </controlaccess>
                </xsl:for-each>

                <xsl:for-each select="marc:datafield[@tag=651]">
                    <controlaccess>
                        <geogname source="lcsh" rules="scm" role="subject"
                            encodinganalog="651">
                            <xsl:for-each select="marc:subfield">
								<xsl:value-of select="." />
								<xsl:if test="position()!=last()">
									<xsl:text> -- </xsl:text>
								</xsl:if>
							</xsl:for-each>
                        </geogname>
                    </controlaccess>
                </xsl:for-each>

                <xsl:for-each select="marc:datafield[@tag=650]">
                    <controlaccess>
                        <subject source="lcsh" encodinganalog="650" rules="scm">
							<xsl:for-each select="marc:subfield">
								<xsl:value-of select="." />
								<xsl:if test="position()!=last()">
									<xsl:text> -- </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</subject>
                    </controlaccess>
                </xsl:for-each>

                <xsl:for-each select="marc:datafield[@tag=655]">
                    <controlaccess>
                        <genreform source="lcsh" encodinganalog="655">
							<xsl:for-each select="marc:subfield">
								<xsl:value-of select="." />
								<xsl:if test="position()!=last()">
									<xsl:text> -- </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</genreform>
                    </controlaccess>
                </xsl:for-each>

                <xsl:for-each select="marc:datafield[@tag=656]">
                    <controlaccess>
                        <occupation source="lcsh" encodinganalog="656">
							<xsl:for-each select="marc:subfield">
								<xsl:value-of select="." />
								<xsl:if test="position()!=last()">
									<xsl:text> -- </xsl:text>
								</xsl:if>
							</xsl:for-each>	
						</occupation>
                    </controlaccess>
                </xsl:for-each>

                <xsl:for-each select="marc:datafield[@tag=657]">
                    <controlaccess>
                        <function source="aat" encodinganalog="657">
							<xsl:for-each select="marc:subfield">
								<xsl:value-of select="." />
								<xsl:if test="position()!=last()">
									<xsl:text> -- </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</function>
                    </controlaccess>
                </xsl:for-each>

                <xsl:for-each select="marc:datafield[@tag=630]">
                    <controlaccess>
                        <title encodinganalog="630" source="lcnaf" rules="aacr2r">
							<xsl:for-each select="marc:subfield">
								<xsl:value-of select="." />
								<xsl:if test="position()!=last()">
									<xsl:text> -- </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</title>
                    </controlaccess>
                </xsl:for-each>
       </controlaccess>
                <xsl:for-each select="marc:datafield[@tag=520]">
                <scopecontent encodinganalog="520$a">
                    <p><xsl:value-of select="marc:subfield[@code='a']" /></p>
                </scopecontent>
            </xsl:for-each>
        </archdesc>
    </xsl:template>
</xsl:stylesheet>
<!--http://creativecommons.org/licenses/zero/1.0/
    Creative Commons 1.0 Universal
    The person who associated a work with this document has dedicated this work to the 
    Commons by waiving all of his or her rights to the work under copyright law and all 
    related or neighboring legal rights he or she had in the work, to the extent allowable by law. 
-->
