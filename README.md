# Gelenkarm – modulares 3D-Druck-Gelenksystem

Modulares Haltesystem für ESP32-CAMs, kleine Kameras, Sensoren und leichtes Werkzeug. Geplant sind drei 120-mm-Arme mit einzeln arretierbaren Gelenken, 150 g Ziel-Nutzlast an der Spitze sowie eine Tischklemme als Basis (alternativ an einem ausreichend schweren Werkstattgewicht befestigt).

## Aktuelle Version: V2.8

**[OpenSCAD-Quelle – Winkelgelenk V2.8](cad/Winkelgelenk_90Grad_V2_8.scad)**

**[Änderungen und Prüfinformationen](cad/Winkelgelenk_90Grad_V2_8.md)**

- 90°-Winkel mit zwei zueinander senkrechten M5-Gelenkachsen
- Langer Schenkel: 30 mm bis Zinkenbeginn; kurzer Schenkel: 10 mm bis Zinkenbeginn
- 2er-/3er-Gabel mit M5-Bohrungen (Ø 5,3 mm)
- Zwei **4 × 4 mm große, nach außen angeformte 45°-Verstärkungsrippen** zwischen den Grundkörperbereichen; Materialzugabe statt Fasenabtrag
- 6-mm-Tragsteg an der 3er-Gabel

### STL exportieren

OpenSCAD-Datei öffnen, **F6** für das vollständige Rendern ausführen und **Datei → Exportieren → STL** wählen. Ein geprüfter V2.8-Testexport wurde im Chat als Prüfpaket bereitgestellt; die GitHub-Datei ist die parametrische CAD-Quelle.

### Drucken und prüfen

Erste Passungsprüfung mit eSUN PLA+ auf Ender 3 V3 SE, beispielsweise 0,20 mm Schichthöhe und fünf Wänden. Bauteil in Cura so orientieren, dass die Schraubenlochachsen günstig zu den Druckschichten liegen. Bei Bedarf Supports in der Schichtvorschau kontrollieren.

**Status:** STL geometrisch geschlossen und zusammenhängend; mechanische Passung, Langzeitstabilität und Ziel-Nutzlast von 150 g sind noch nicht durch einen Belastungstest nachgewiesen.

### Geplante nächste Schritte

1. V2.8 in Cura und im realen Gabelverbund prüfen.
2. 120-mm-Armmodule für kombinierbare Gabelgelenke konstruieren.
3. Tischklemme mit Metallspindel und Montageoption für Werkstattgewicht erstellen.
4. Wechseladapter für Kamera-/Werkzeughalter entwickeln.
5. Gelenk- und Standsicherheitsprüfung mit realer Last durchführen.

Alte CAD-Zwischenstände wurden aus dem aktuellen Repository entfernt; sie bleiben über die Git-Historie nachvollziehbar.
