<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
    <title>Music Library</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fff;
            color: #000;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        header, footer {
            text-align: center;
            padding: 20px 0;
            background-color: #000;
            color: #fff;
        }
        h1, h2, h3, h4 {
            margin: 10px 0;
        }
        .query-section, .song-list {
            margin: 20px 0;
            padding: 20px;
            border: 1px solid #000;
        }
        .query-result {
            padding: 10px;
            border-top: 1px solid #000;
        }
        .song-card {
            border-bottom: 1px solid #000;
            padding: 15px 0;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            padding: 5px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Music Library</h1>
        </header>
        
        <div class="query-section">
            <h2>XPath Query Results</h2>
            <h3>All Song Titles</h3>
            <div class="query-result">
                <ul>
                    <xsl:for-each select="//songTitle">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
            </div>
            <h3>Artist of the Fifth Song</h3>
            <div class="query-result">
                <xsl:value-of select="//song[5]/artist"/>
            </div>
            <h3>Song with ID = 1</h3>
            <div class="query-result">
                <div><strong>Title: </strong> <xsl:value-of select="//song[@id='1']/songTitle"/></div>
                <div><strong>Artist: </strong> <xsl:value-of select="//song[@id='1']/artist"/></div>
                <div><strong>Year: </strong> <xsl:value-of select="//song[@id='1']/debutYear"/></div>
            </div>
        </div>
        
        <h2>Complete Music Collection</h2>
        <div class="song-list">
            <xsl:for-each select="music/song">
                <div class="song-card">
                    <h3><xsl:value-of select="songTitle"/></h3>
                    <p><strong>Artist: </strong> <xsl:value-of select="artist"/></p>
                    <p><strong>Debut Year: </strong> <xsl:value-of select="debutYear"/></p>
                    <div>
                        <h4>Albums: </h4>
                        <ul>
                            <xsl:for-each select="albums/album">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </div>
            </xsl:for-each>
        </div>
        
        <footer>
            <p>© 2025 Music Library</p>
        </footer>
    </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>