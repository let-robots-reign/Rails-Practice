<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Ответ</title>
      </head>
      <body>
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Factorial</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="objects/object">
              <tr>
                <td>
                  <xsl:value-of select="id"/>
                </td>
                <td>
                  <xsl:variable name="fact">
                    <xsl:value-of select="factorial"/>
                    <xsl:text>! = </xsl:text>
                    <xsl:for-each select="multipliers/multiplier">
                      <xsl:if test="position() > 1">
                        <xsl:text> * </xsl:text>
                      </xsl:if>
                      <xsl:value-of select="."/>
                    </xsl:for-each>
                  </xsl:variable>

                  <xsl:value-of select="$fact"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>