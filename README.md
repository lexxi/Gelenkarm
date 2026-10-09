# Gelenkarm – modularer 3D-gedruckter Haltearm

**Status: V1.0 Kugelgelenk-Test (Prototyp, keine freigegebene Traglast)**

Ziel: modularer Halter für ESP32-CAMs, kleine Kameras, Sensoren und leichtes Werkzeug. Geplant sind drei 120-mm-Arme mit einzeln arretierbaren Kugelgelenken, 150 g Nutzlast an der Spitze und eine universelle Tischklemme. Wahlweise wird die Klemme an einem geeigneten Werkstattgewicht befestigt.

## Aktueller Umfang

Der erste Test enthält eine 25-mm-Kugel mit **65-mm-Testhebel** und eine zweiteilige Kugelpfanne mit **zwei M5-Klemmschrauben**. Dies ist **noch nicht** der fertige 3 × 120-mm-Arm und enthält noch keine Tischklemme.

Quelle: [Gelenk_V1_Test.scad](cad/Gelenk_V1_Test.scad).

### STL in OpenSCAD exportieren

1. `cad/Gelenk_V1_Test.scad` öffnen.
2. `teil` einzeln auf `"backe_oben"`, `"backe_unten"` oder `"kugel_test"` setzen.
3. Mit F6 rendern und über *Datei → Exportieren → STL* exportieren.
4. Für jeden der drei Teile wiederholen.

### Druckempfehlung (Ender 3 V3 SE / eSUN PLA+)

- 0,20 mm Schichthöhe, 5 Wände.
- Klemmbacken: 60 % Infill; Kugel: 80–100 %.
- Kugel mit Stiel benötigt möglicherweise Stützmaterial.
- Klemmbacken für gute Auflage im Slicer sinnvoll orientieren; Druckorientierung und Schraubenlast beachten.

### Hardware und Montage

- 2 × M5-Schraube, Länge am Druckteil prüfen (Richtwert 35–40 mm).
- 2 × M5-Sechskantmutter und 2 × Unterlegscheibe.
- Kugel zwischen die Backen setzen, Muttern einsetzen und Schrauben **schrittweise** anziehen.
- Beweglichkeit, Klemmkraft, Bruchstellen und Kriechen prüfen.

**Wichtig:** Nicht ohne Belastungsprüfung mit Kamera oder empfindlichen Geräten über einer ungeschützten Fläche einsetzen. Die 150 g bei 360 mm Ausladung sind eine *Zielvorgabe*, kein geprüfter Wert.

### Geplante nächste Schritte

1. Kugelpassung und Klemmschrauben im Testdruck prüfen.
2. 120-mm-Module und einzeln arretierbare Gelenke konstruieren.
3. Tischklemme mit Metallspindel und austauschbarer Kugelaufnahme entwickeln.
4. Wechseladapter für 1/4"-20-UNC-Kameragewinde und Werkzeuge.
5. Endlast und Kipp-/Klemmstabilität testen.

Die fertigen STL-Testexporte sind derzeit im ursprünglichen Test-ZIP enthalten; dieses Repository enthält die reproduzierbare OpenSCAD-Quelle.
