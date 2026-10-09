/* Modularer Gelenkarm - Kugelgelenk-Test V1.0
   OpenSCAD: Auswahl per 'teil' und F6 -> STL exportieren.
   Einheiten: mm. Kugel 25 mm; zwei M5-Klemmschrauben.
   Nur Prototyp, keine Sicherheits- oder Traglastgarantie.
*/
$fn = 80;
teil = "alle"; // "alle", "backe_oben", "backe_unten", "kugel_test"

kugel_d = 25;
kugel_r = kugel_d/2;
pfannen_r = 12.55; // zuerst testen, danach an Drucker anpassen
backen_b = 52;    // X
backen_t = 42;    // Y
backen_h = 16;    // Z pro Hälfte
schrauben_x = 20;
m5_durchgang = 5.5;
m5_kopf_d = 10.0; // Durchlass fuer M5-Innensechskantkopf / Scheibe
m5_kopf_t = 5.2;
mutter_sw = 8.3; // M5 Sechskantmutter, Schluesselweite mit Spiel
mutter_t = 4.3;
stiel_r = 4.5;
schlitz_r = 5.3; // freie Beweglichkeit des Kugelstiels
hebel_laenge = 65; // kompakter Pruefhebel, nicht finaler 120-mm-Arm

// Beide Pfannen zeigen zur Trennebene z=0; Gewindebolzen gehen von oben nach unten.
module backe(oben=true) {
    // oben: 0..16; unten: -16..0
    difference() {
        translate([-backen_b/2,-backen_t/2, oben ? 0 : -backen_h])
            cube([backen_b,backen_t,backen_h]);
        // Kugelpfanne mit 0.6 mm versetztem Zentrum fuer Klemmreserve.
        translate([0,0, oben ? 0.6 : -0.6]) sphere(r=pfannen_r);
        // Stiel-Freiraum beidseitig in Y-Richtung; vergroessern falls noetig.
        rotate([90,0,0]) cylinder(r=schlitz_r,h=backen_t+2,center=true);
        for (x=[-schrauben_x,schrauben_x]) {
            translate([x,0,-backen_h-1]) cylinder(d=m5_durchgang,h=backen_h*2+2);
            if (oben) {
                // versenkter Schraubenkopf auf Oberseite
                translate([x,0,backen_h-m5_kopf_t]) cylinder(d=m5_kopf_d,h=m5_kopf_t+0.5);
            } else {
                // Sechskant-Mutterntasche auf Unterseite; M5 SW8
                translate([x,0,-backen_h-0.01]) cylinder(d=mutter_sw/cos(30),h=mutter_t,$fn=6);
            }
        }
    }
}

// Kugel mit 65-mm Testhebel entlang Y. Kann spaeter gegen den 120-mm Arm ersetzt werden.
module kugel_test() {
    union() {
        sphere(r=kugel_r);
        // zylindrischer Hals + Hebel; beginnt ueberlappend in Kugel
        translate([0,kugel_r-2,0]) rotate([-90,0,0]) cylinder(r=stiel_r,h=hebel_laenge);
        // eine plane Stirnflaeche zur Montage einer kleinen Prueflast
    }
}

if (teil=="backe_oben") backe(true);
else if (teil=="backe_unten") backe(false);
else if (teil=="kugel_test") kugel_test();
else if (teil=="alle") {
    // Druckbett-Layout: Backen liegen flach; Kugel mit Stiel separat, Stuetzen ggf. erforderlich.
    translate([-65,0,0]) backe(true);
    translate([0,0,16]) backe(false);
    translate([65,0,kugel_r]) kugel_test();
}
