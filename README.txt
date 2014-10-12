Die Stadt Hamburg gibt ihre Hausnummern unter Freier Lizenz raus:

Siehe:

http://suche.transparenz.hamburg.de/dataset/alkis-adressen-hamburg

bzw:

http://daten-hamburg.de/lgv/alkis/Adressen.zip 

Dieses Skript verwandelt die Adressen.gml in etwas lesbares (ASCII).


Aufruf:

perl werteAus.pl | cs2cs -f "%.6f" +init=epsg:25832 +to +init=epsg:4326

Wenn jemand eine besssere Methode hat, das zu machen, z.B. mit popen oder Geo:Proj4 bitte melden.

