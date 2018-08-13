# Automatische Anzeige von Artikeldetails im Ticket-Zoom

Dieses Paket blendet automatisch die Artikeldetails (Absender, Betreff, etc.) im Ticket-Zoom ein, sofern nur ein Artikel angezeigt wird (Artikelanzeige als "Einen Beitrag anzeigen" konfiguriert oder Ticket enthält nur einen Artikel).

## Anzeige der Artikeldetails für alle Artikel

Wenn für die Artikel-Anzeige "All Beiträge anzeigen" ausgewählt wird, dann können die Artikeldetails auch eingeblendet werden. Hierfür muss aber erst eine Konfiguration aktiviert werden:

**SysConfig: Core::Znuny4OTRS::ZoomArticleDetailsExpand::AllArticles** => Ja
