# Funktionalität

Dieses Paket blendet automatisch die Artikeldetails (Absender, Betreff, etc.) im Ticket-Zoom ein, sofern nur ein Artikel angezeigt wird (Artikelanzeige als "Einen Beitrag anzeigen" konfiguriert oder Ticket enthält nur einen Artikel).

Sofern die Artikeldetails für alle Artikel angezeigt werden sollen (bei Einstellung "Alle Beiträge anzeigen"), muss die SysConfig-Option __Core::Znuny4OTRS::ZoomArticleDetailsExpand::AllArticles__ aktiviert werden.

__HINWEIS__
Bei Verwendung von OTRS 6.0.18 oder neuer wird die OTRS-Standard-Konfigurationsoption __Ticket::Frontend::ArticleHeadVisibleDefault__ bei Installation des Pakets deaktiviert, da die dahinterstehende Funktion inkompatibel zu der dieses Pakets ist. Die Funktionalität dieses Pakets ist umfangreicher als die der Standard-OTRS-Funktion, so dass keinerlei Nachteile entstehen.
